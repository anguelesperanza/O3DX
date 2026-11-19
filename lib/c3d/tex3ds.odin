package c3d

// ============================================================
// Tex3DS — loading .t3x textures made by tex3ds / tritex
// Source: citro3d/include/tex3ds.h (part of libcitro3d)
//
// A .t3x holds one texture (2D or cube map, optionally with mipmaps) and a
// list of subtextures: the rectangles of a sprite atlas. Import fills a
// C3D_Tex and returns a handle for the subtexture list; free the handle
// with Tex3DS_TextureFree and the texture with C3D_TexDelete.
//
//   tex: c3d.C3D_Tex
//   t3x := c3d.Tex3DS_TextureImport(raw_data(bytes), uint(len(bytes)), &tex, nil, false)
//   sub := c3d.Tex3DS_GetSubTexture(t3x, 0)
//   ...
//   c3d.Tex3DS_TextureFree(t3x)
//   c3d.C3D_TexDelete(&tex)
//
// None of these take or return floats, so no bridge is needed. The
// subtexture corner helpers at the bottom are written in Odin.
// ============================================================

// Tex3DS_Texture — handle to an imported texture's subtexture list.
Tex3DS_Texture :: distinct rawptr

// decompressCallback (3ds/util/decompress.h) — supplies compressed input:
// copy up to `size` bytes into `buffer` and return how many were copied,
// or -1 on error. It is called from C, so it uses the C calling convention.
decompressCallback :: #type proc "c" (userdata: rawptr, buffer: rawptr, size: uint) -> int

foreign import citro3d_tex3ds "system:citro3d"

@(default_calling_convention = "c")
foreign citro3d_tex3ds {
    // From a .t3x already in memory. texcube is only used for cube maps.
    // vram puts the texture in VRAM instead of linear memory.
    Tex3DS_TextureImport :: proc(input: rawptr, insize: uint, tex: ^C3D_Tex, texcube: ^C3D_TexCube, vram: bool) -> Tex3DS_Texture ---

    // From data supplied piece by piece by callback.
    Tex3DS_TextureImportCallback :: proc(tex: ^C3D_Tex, texcube: ^C3D_TexCube, vram: bool, callback: decompressCallback, userdata: rawptr) -> Tex3DS_Texture ---

    // From an open file descriptor.
    Tex3DS_TextureImportFD :: proc(fd: i32, tex: ^C3D_Tex, texcube: ^C3D_TexCube, vram: bool) -> Tex3DS_Texture ---

    // From an open FILE* (ctru.fopen).
    Tex3DS_TextureImportStdio :: proc(fp: rawptr, tex: ^C3D_Tex, texcube: ^C3D_TexCube, vram: bool) -> Tex3DS_Texture ---

    Tex3DS_GetNumSubTextures :: proc(texture: Tex3DS_Texture) -> uint ---
    Tex3DS_GetSubTexture     :: proc(texture: Tex3DS_Texture, index: uint) -> ^Tex3DS_SubTexture ---

    // Frees the subtexture list only; the C3D_Tex is freed with C3D_TexDelete.
    Tex3DS_TextureFree :: proc(texture: Tex3DS_Texture) ---
}

// tex3ds stores a subtexture that was rotated to fit the atlas with its
// top and bottom swapped; the corner helpers below undo that.
Tex3DS_SubTextureRotated :: proc "contextless" (subtex: ^Tex3DS_SubTexture) -> bool {
    return subtex.top < subtex.bottom
}

// The u, v texture coordinates of each corner, allowing for rotation.
Tex3DS_SubTextureBottomLeft :: proc "contextless" (subtex: ^Tex3DS_SubTexture, u, v: ^f32) {
    if Tex3DS_SubTextureRotated(subtex) {
        u^ = subtex.bottom
        v^ = subtex.left
    } else {
        u^ = subtex.left
        v^ = subtex.bottom
    }
}

Tex3DS_SubTextureBottomRight :: proc "contextless" (subtex: ^Tex3DS_SubTexture, u, v: ^f32) {
    if Tex3DS_SubTextureRotated(subtex) {
        u^ = subtex.bottom
        v^ = subtex.right
    } else {
        u^ = subtex.right
        v^ = subtex.bottom
    }
}

Tex3DS_SubTextureTopLeft :: proc "contextless" (subtex: ^Tex3DS_SubTexture, u, v: ^f32) {
    if Tex3DS_SubTextureRotated(subtex) {
        u^ = subtex.top
        v^ = subtex.left
    } else {
        u^ = subtex.left
        v^ = subtex.top
    }
}

Tex3DS_SubTextureTopRight :: proc "contextless" (subtex: ^Tex3DS_SubTexture, u, v: ^f32) {
    if Tex3DS_SubTextureRotated(subtex) {
        u^ = subtex.top
        v^ = subtex.right
    } else {
        u^ = subtex.right
        v^ = subtex.top
    }
}
