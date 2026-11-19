package dot3_example

import "core:math"

import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// Tests GPU_COMBINEFUNC.DOT3_RGB / .DOT3_RGBA (DOT3_RGBA was missing) and
// C3D_TexEnvColor.
//
// The dome is a TRIANGLE_FAN whose vertex colours encode a surface normal
// (colour = normal * 0.5 + 0.5). TexEnv stage 0 takes the dot product of
// that colour with a constant colour holding the light direction:
//
//     result = 4 * ((r0-0.5)*(r1-0.5) + (g0-0.5)*(g1-0.5) + (b0-0.5)*(b1-0.5))
//
// so the dome is shaded like a lit ball, brightest on the side facing the
// light. Stage 1 tints it orange.
//
//   DOT3_RGB   the RGB combiner does the dot product; the alpha combiner
//              is REPLACE, so alpha is the vertex alpha (1) and the dome is
//              opaque.
//   DOT3_RGBA  the dot product goes to alpha too; with alpha blending on,
//              the dark side fades into the blue background.
//
// DOT3_RGBA must be set on BOTH combiners (C3D_Both). With DOT3_RGBA on RGB
// and something else on alpha, real hardware writes a broken alpha: specks
// along the triangle edges and a dark blot near the brightest point.
// (Setting DOT3_RGB on both is wrong the other way: the alpha combiner then
// also takes the dot product, and DOT3_RGB looks like DOT3_RGBA.)
//
// The two VIEW modes draw a combiner result as grey, opaque, to check the
// hardware: ALPHA VIEW shows the alpha DOT3_RGBA writes, RGB VIEW the red
// channel DOT3_RGB writes. Both should be the same smooth grey ball.
//
// Controls:
//   Circle pad  move the light
//   A           next mode: DOT3_RGB, DOT3_RGBA, ALPHA VIEW, RGB VIEW
//   START       exit

DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

Vertex :: struct {
    x, y, z:    f32,
    r, g, b, a: f32,
}

RIM       :: 48
FAN_COUNT :: RIM + 2 // centre, rim points, first rim point again

CENTER_X :: 200.0
CENTER_Y :: 120.0
RADIUS   :: 100.0

fan_vertices: [FAN_COUNT]Vertex

build_dome :: proc "contextless" () {
    // Centre: normal straight out of the screen. Rim: normal in the screen
    // plane, pointing outwards.
    fan_vertices[0] = Vertex{CENTER_X, CENTER_Y, 0.5, 0.5, 0.5, 1.0, 1.0}
    for i in 0 ..= RIM {
        a := f32(i) / f32(RIM) * c3d.C3D_TAU
        nx := math.cos(a)
        ny := math.sin(a) // up on screen is -y in this projection
        fan_vertices[i + 1] = Vertex{
            CENTER_X + RADIUS * nx, CENTER_Y - RADIUS * ny, 0.5,
            0.5 + 0.5 * nx, 0.5 + 0.5 * ny, 0.5, 1.0,
        }
    }
}

// Pack a direction (each component -1..1) as a TexEnv constant colour.
// C3D_TexEnvColor takes 0xAABBGGRR.
pack_dir :: proc "contextless" (x, y, z: f32) -> u32 {
    r := u32(clamp(0.5 + 0.5 * x, 0.0, 1.0) * 255.0)
    g := u32(clamp(0.5 + 0.5 * y, 0.0, 1.0) * 255.0)
    b := u32(clamp(0.5 + 0.5 * z, 0.0, 1.0) * 255.0)
    return 0xFF000000 | b << 16 | g << 8 | r
}

Mode :: enum {
    DOT3_RGB,
    DOT3_RGBA,
    ALPHA_VIEW,
    RGB_VIEW,
}

mode_name := [Mode]cstring{
    .DOT3_RGB   = "DOT3_RGB  ",
    .DOT3_RGBA  = "DOT3_RGBA ",
    .ALPHA_VIEW = "ALPHA VIEW",
    .RGB_VIEW   = "RGB VIEW  ",
}

@(export, link_name = "odin_main")
dot3_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    ctru.romfsInit()
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    top := c3d.C3D_RenderTargetCreate(240, 400, .RGBA8, c3d.C3D_DEPTHTYPE_DEPTH24_STENCIL8)
    c3d.C3D_RenderTargetSetOutput(top, ctru.GFX_TOP, ctru.GFX_LEFT, DISPLAY_TRANSFER_FLAGS)

    sf := ctru.fopen("romfs:/vshader.shbin", "rb")
    ctru.fseek(sf, 0, ctru.SEEK_END)
    sh_size := ctru.ftell(sf)
    ctru.fseek(sf, 0, ctru.SEEK_SET)
    sh_buf := ctru.malloc(uint(sh_size))
    ctru.fread(sh_buf, 1, uint(sh_size), sf)
    ctru.fclose(sf)

    dvlb := ctru.DVLB_ParseFile(cast(^u32)sh_buf, u32(sh_size))
    prog: ctru.shaderProgram_s
    ctru.shaderProgramInit(&prog)
    ctru.shaderProgramSetVsh(&prog, dvlb.DVLE)
    c3d.C3D_BindProgram(&prog)

    uloc_proj := i32(ctru.shaderInstanceGetUniformLocation(prog.vertexShader, "projection"))

    attr_info := c3d.C3D_GetAttrInfo()
    c3d.AttrInfo_Init(attr_info)
    c3d.AttrInfo_AddLoader(attr_info, 0, .FLOAT, 3)
    c3d.AttrInfo_AddLoader(attr_info, 1, .FLOAT, 4)

    build_dome()
    vbo_size := uint(size_of(fan_vertices))
    vbo_data := ctru.linearAlloc(vbo_size)
    ctru.memcpy(vbo_data, &fan_vertices, vbo_size)

    buf_info := c3d.C3D_GetBufInfo()
    c3d.BufInfo_Init(buf_info)
    c3d.BufInfo_Add(buf_info, vbo_data, size_of(Vertex), 2, 0x10)

    c3d.C3D_DepthTest(false, .ALWAYS, .ALL)
    c3d.C3D_CullFace(.NONE)
    c3d.C3D_AlphaBlend(.ADD, .ADD, .SRC_ALPHA, .ONE_MINUS_SRC_ALPHA, .SRC_ALPHA, .ONE_MINUS_SRC_ALPHA)

    projection: c3d.C3D_Mtx
    projection.r[0] = c3d.C3D_FVec{ 1.0, 0.0, -2.0 / 240.0, 0.0}
    projection.r[1] = c3d.C3D_FVec{ 1.0, 0.0, 0.0, -2.0 / 400.0}
    projection.r[2] = c3d.C3D_FVec{-1.0, 1.0, 0.0, 0.0}
    projection.r[3] = c3d.C3D_FVec{ 1.0, 0.0, 0.0, 0.0}

    mode := Mode.DOT3_RGB

    ctru.printf("\x1b[1;1HDot3-Example")
    ctru.printf("\x1b[3;1HDOT3_RGB=%d DOT3_RGBA=%d (expect 6, 7)", i32(c3d.GPU_COMBINEFUNC.DOT3_RGB), i32(c3d.GPU_COMBINEFUNC.DOT3_RGBA))
    ctru.printf("\x1b[8;1HRGB:  opaque lit ball")
    ctru.printf("\x1b[9;1HRGBA: dark side fades into blue")
    ctru.printf("\x1b[10;1HVIEWs: grey ball, both the same")
    ctru.printf("\x1b[11;1HPad: move light  A: next mode")
    ctru.printf("\x1b[12;1HSTART: exit")

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        down := ctru.hidKeysDown()
        if down & ctru.KEY_START != 0 do break
        if down & ctru.KEY_A != 0 {
            if mode == max(Mode) {
                mode = min(Mode)
            } else {
                mode = Mode(int(mode) + 1)
            }
        }

        pad: ctru.circlePosition
        ctru.hidCircleRead(&pad)
        lx := f32(pad.dx) / 156.0
        ly := f32(pad.dy) / 156.0
        lz: f32 = 0.6
        inv_len := 1.0 / math.sqrt(lx * lx + ly * ly + lz * lz)
        lx *= inv_len
        ly *= inv_len
        lz *= inv_len

        func := c3d.GPU_COMBINEFUNC.DOT3_RGB
        if mode == .DOT3_RGBA || mode == .ALPHA_VIEW do func = .DOT3_RGBA

        light := pack_dir(lx, ly, lz)
        ctru.printf("\x1b[5;1HMode: %s", mode_name[mode])
        ctru.printf("\x1b[6;1HLight: %5.2f %5.2f %5.2f", f64(lx), f64(ly), f64(lz))
        ctru.printf("\x1b[7;1HConstant: 0x%08lX", light)

        // Stage 0: dot(vertex colour, light colour).
        env0 := c3d.C3D_GetTexEnv(0)
        c3d.C3D_TexEnvInit(env0)
        // DOT3_RGBA goes on both combiners; DOT3_RGB on RGB only, with the
        // alpha combiner keeping the vertex alpha. See the top of the file.
        c3d.C3D_TexEnvSrc(env0, c3d.C3D_Both, .PRIMARY_COLOR, .CONSTANT, .PRIMARY_COLOR)
        if func == .DOT3_RGBA {
            c3d.C3D_TexEnvFunc(env0, c3d.C3D_Both, func)
        } else {
            c3d.C3D_TexEnvFunc(env0, c3d.C3D_RGB, func)
            c3d.C3D_TexEnvFunc(env0, c3d.C3D_Alpha, .REPLACE)
        }
        c3d.C3D_TexEnvColor(env0, light)

        env1 := c3d.C3D_GetTexEnv(1)
        c3d.C3D_TexEnvInit(env1)
        switch mode {
        case .DOT3_RGB, .DOT3_RGBA:
            // Tint the RGB orange, keep stage 0's alpha.
            c3d.C3D_TexEnvSrc(env1, c3d.C3D_RGB, .PREVIOUS, .CONSTANT, .PRIMARY_COLOR)
            c3d.C3D_TexEnvFunc(env1, c3d.C3D_RGB, .MODULATE)
            c3d.C3D_TexEnvSrc(env1, c3d.C3D_Alpha, .PREVIOUS, .PRIMARY_COLOR, .PRIMARY_COLOR)
            c3d.C3D_TexEnvFunc(env1, c3d.C3D_Alpha, .REPLACE)
            c3d.C3D_TexEnvColor(env1, 0xFF3399FF)
        case .ALPHA_VIEW:
            // Grey = stage 0's alpha; the output itself is opaque.
            c3d.C3D_TexEnvSrc(env1, c3d.C3D_RGB, .PREVIOUS, .PREVIOUS, .PREVIOUS)
            c3d.C3D_TexEnvOpRgb(env1, .SRC_ALPHA, .SRC_COLOR, .SRC_COLOR)
            c3d.C3D_TexEnvFunc(env1, c3d.C3D_RGB, .REPLACE)
            c3d.C3D_TexEnvSrc(env1, c3d.C3D_Alpha, .CONSTANT, .CONSTANT, .CONSTANT)
            c3d.C3D_TexEnvFunc(env1, c3d.C3D_Alpha, .REPLACE)
            c3d.C3D_TexEnvColor(env1, 0xFFFFFFFF)
        case .RGB_VIEW:
            // Grey = stage 0's red channel; the output itself is opaque.
            c3d.C3D_TexEnvSrc(env1, c3d.C3D_RGB, .PREVIOUS, .PREVIOUS, .PREVIOUS)
            c3d.C3D_TexEnvOpRgb(env1, .SRC_R, .SRC_COLOR, .SRC_COLOR)
            c3d.C3D_TexEnvFunc(env1, c3d.C3D_RGB, .REPLACE)
            c3d.C3D_TexEnvSrc(env1, c3d.C3D_Alpha, .CONSTANT, .CONSTANT, .CONSTANT)
            c3d.C3D_TexEnvFunc(env1, c3d.C3D_Alpha, .REPLACE)
            c3d.C3D_TexEnvColor(env1, 0xFFFFFFFF)
        }

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x203A80FF, 0)
        c3d.C3D_FrameDrawOn(top)

        c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uloc_proj, &projection)
        c3d.C3D_DrawArrays(.TRIANGLE_FAN, 0, FAN_COUNT)

        c3d.C3D_FrameEnd(0)
    }

    ctru.linearFree(vbo_data)
    ctru.shaderProgramFree(&prog)
    ctru.DVLB_Free(dvlb)
    ctru.free(sh_buf)
    c3d.C3D_Fini()
    ctru.gfxExit()
    ctru.romfsExit()
    return 0
}
