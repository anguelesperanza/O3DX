package image_tex

/*
	Converts a PNG to a custom .t3x texture file for the 3DS.
	Usage: png2t3x <input.png> <output.t3x>

	T3X File Layout:
	-------------------------------------
	Offset  Size  Description
	0x00    4     Magic "TX30"
	0x04    4     texture_count (always 1)
	0x08    4     offset_to_first_texture (always 16)
	0x0C    4     reserved (0)

	Texture Block:
	-------------------------------------
	0x10    4     width
	0x14    4     height
	0x18    4     format (GPU_RGBA8 = 0x0A)
	0x1C    4     data_size (width * height * 4)
	0x20    ...   pixel data — RGBA8, Morton-swizzled 8x8 tiles, Y-flipped
*/

import "core:mem"
import "core:os"
import "core:fmt"
import "core:image"
import _ "core:image/png"
import _ "core:image/jpeg"

HEADER :: struct {
	magic:                   [4]u8,
	texture_count:           u32,
	offset_to_first_texture: u32,
	reserved:                u32,
}

TEXTURE :: struct {
	width:     u32,
	height:    u32,
	format:    u32,
	data_size: u32,
	data:      []u8,
}

T3X :: struct {
	header:  HEADER,
	texture: TEXTURE,
}

GPU_RGBA8 :: u32(0x0A)

load_image :: proc(filepath: string) -> image.Image {
	// alpha_add_if_missing expands palette and greyscale modes to full RGBA8.
	// image.load_from_file dispatches by magic bytes, so PNG and JPEG both work.
	img, err := image.load_from_file(filepath, options = {.alpha_add_if_missing})
	if err != nil {
		fmt.eprintf("Could not load '%s': %v\n", filepath, err)
		os.exit(1)
	}
	return img^
}

// Converts any-channel image.Image to a flat []u8 in ABGR byte order.
// GPU_RGBA8 on the 3DS is a little-endian 32-bit word with R in the MSB,
// so the in-memory byte order is A, B, G, R (lowest → highest address).
to_abgr8 :: proc(img: image.Image) -> []u8 {
	width  := img.width
	height := img.height
	src    := img.pixels.buf[:]

	bytes_per_pixel := len(src) / (width * height)
	dst := make([]u8, width * height * 4)

	for i in 0 ..<width * height {
		src_i := i * bytes_per_pixel
		dst_i := i * 4
		switch bytes_per_pixel {
		case 4:
			dst[dst_i+0] = src[src_i+3] // A
			dst[dst_i+1] = src[src_i+2] // B
			dst[dst_i+2] = src[src_i+1] // G
			dst[dst_i+3] = src[src_i+0] // R
		case 3:
			dst[dst_i+0] = 255           // A
			dst[dst_i+1] = src[src_i+2] // B
			dst[dst_i+2] = src[src_i+1] // G
			dst[dst_i+3] = src[src_i+0] // R
		case:
			// greyscale
			gray := src[src_i]
			dst[dst_i+0] = 255 // A
			dst[dst_i+1] = gray
			dst[dst_i+2] = gray
			dst[dst_i+3] = gray
		}
	}
	return dst
}

// Tiles src into 8x8 blocks using Morton/Z-curve order within each tile.
// Also Y-flips: PNG row 0 is top, 3DS textures store the bottom row first.
// Width and height must both be multiples of 8.
swizzle_rgba8 :: proc(src: []u8, width, height: int) -> []u8 {
	tiles_x := width  / 8
	tiles_y := height / 8
	dst := make([]u8, width * height * 4)

	for tile_y in 0 ..<tiles_y {
		for tile_x in 0 ..<tiles_x {
			tile_index := tile_y * tiles_x + tile_x
			for py in 0 ..<8 {
				for px in 0 ..<8 {
					// Y-flip so bottom of PNG becomes first row in texture memory
					src_y := (height - 1) - (tile_y*8 + py)
					src_x := tile_x*8 + px
					src_i := (src_y*width + src_x) * 4

					// Morton / Z-curve index within the 8x8 tile
					morton := (px & 1)       |
					          ((py & 1) << 1) |
					          ((px & 2) << 1) |
					          ((py & 2) << 2) |
					          ((px & 4) << 2) |
					          ((py & 4) << 3)
					dst_i := (tile_index*64 + morton) * 4

					dst[dst_i+0] = src[src_i+0]
					dst[dst_i+1] = src[src_i+1]
					dst[dst_i+2] = src[src_i+2]
					dst[dst_i+3] = src[src_i+3]
				}
			}
		}
	}
	return dst
}

convert_to_t3x :: proc(loaded_image: image.Image, format: u32 = GPU_RGBA8) -> T3X {
	t3x: T3X
	t3x.header.magic                   = [4]u8{84, 88, 51, 48} // "TX30"
	t3x.header.texture_count           = 1
	t3x.header.offset_to_first_texture = 16
	t3x.header.reserved                = 0

	t3x.texture.width     = u32(loaded_image.width)
	t3x.texture.height    = u32(loaded_image.height)
	t3x.texture.format    = format
	t3x.texture.data_size = u32(loaded_image.width * loaded_image.height * 4)

	rgba := to_abgr8(loaded_image)
	t3x.texture.data = swizzle_rgba8(rgba, loaded_image.width, loaded_image.height)
	return t3x
}

write_t3x :: proc(path: string, t3x: T3X) -> bool {
	fd, err := os.open(path, os.O_CREATE | os.O_TRUNC | os.O_WRONLY, os.Permissions_Read_Write_All)
	if err != os.ERROR_NONE {
		fmt.eprintf("Failed to create '%s': %v\n", path, err)
		return false
	}
	defer os.close(fd)

	magic := t3x.header.magic
	os.write(fd, magic[:])
	os.write(fd, mem.slice_to_bytes([]u32{t3x.header.texture_count}))
	os.write(fd, mem.slice_to_bytes([]u32{t3x.header.offset_to_first_texture}))
	os.write(fd, mem.slice_to_bytes([]u32{t3x.header.reserved}))

	os.write(fd, mem.slice_to_bytes([]u32{t3x.texture.width}))
	os.write(fd, mem.slice_to_bytes([]u32{t3x.texture.height}))
	os.write(fd, mem.slice_to_bytes([]u32{t3x.texture.format}))
	os.write(fd, mem.slice_to_bytes([]u32{t3x.texture.data_size}))
	os.write(fd, t3x.texture.data)
	return true
}

main :: proc() {
	args := os.args
	if len(args) != 3 {
		fmt.eprintfln("Usage: %s <input.png> <output.t3x>", args[0])
		os.exit(1)
	}

	input  := args[1]
	output := args[2]

	fmt.printfln("Converting '%s' -> '%s'", input, output)
	img := load_image(input)
	t3x := convert_to_t3x(img)

	if !write_t3x(output, t3x) {
		fmt.eprintfln("Failed to write '%s'", output)
		os.exit(1)
	}
	fmt.printfln("Done: %dx%d RGBA8", img.width, img.height)
}
