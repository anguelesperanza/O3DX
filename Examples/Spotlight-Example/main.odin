package spotlight_example

import "core:math"

import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// Tests the lighting fixes:
//   - C3D_Light is 112 bytes (it was declared as 64, so citro3d wrote past
//     the end of every light). Two lights sit next to each other in an array
//     here; with the old size the second one overlapped the first.
//   - GPU_LIGHTLUTID.SP / .DA exist with the right values (2 and 7).
//   - LightLut_Spotlight, LightLutDA_Quadratic and C3D_LightSpotDir.
//
// What you should see: a grey wall lit by
//   - a warm white spotlight from the camera: a sharp-edged round spot that
//     follows the circle pad / D-pad;
//   - a blue point light circling in front of the wall: a soft blue glow
//     that is brightest where the light is closest (distance attenuation).
//
// Controls:
//   Circle pad / D-pad  aim the spotlight
//   A  toggle the blue light
//   X  toggle the blue light's distance attenuation (off: the blue spreads
//      evenly over the wall)
//   Y  toggle the spot cone (off: the white light covers the whole wall)
//   START  exit
//
// The wall is dim grey where neither light reaches, against a blue
// background.

DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

Vertex :: struct {
    x,  y,  z:  f32,
    nx, ny, nz: f32,
}

// A wall at z = -6 facing the camera. The screen shows about +-3.6 by
// +-2.2 at that distance, so the wall (+-2.4 by +-1.5) has its edges in view.
WALL_Z :: -6.0

vertex_list := [6]Vertex{
    {-2.4, -1.5, WALL_Z,  0.0, 0.0, 1.0},
    { 2.4, -1.5, WALL_Z,  0.0, 0.0, 1.0},
    { 2.4,  1.5, WALL_Z,  0.0, 0.0, 1.0},
    {-2.4, -1.5, WALL_Z,  0.0, 0.0, 1.0},
    { 2.4,  1.5, WALL_Z,  0.0, 0.0, 1.0},
    {-2.4,  1.5, WALL_Z,  0.0, 0.0, 1.0},
}

on_off :: proc "contextless" (b: bool) -> cstring {
    if b do return "ON "
    return "OFF"
}

@(export, link_name = "odin_main")
spotlight_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
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

    uloc_mvp := i32(ctru.shaderInstanceGetUniformLocation(prog.vertexShader, "mvp"))
    uloc_mv  := i32(ctru.shaderInstanceGetUniformLocation(prog.vertexShader, "modelView"))

    attr_info := c3d.C3D_GetAttrInfo()
    c3d.AttrInfo_Init(attr_info)
    c3d.AttrInfo_AddLoader(attr_info, 0, .FLOAT, 3)
    c3d.AttrInfo_AddLoader(attr_info, 1, .FLOAT, 3)

    vbo_size := uint(size_of(vertex_list))
    vbo_data := ctru.linearAlloc(vbo_size)
    ctru.memcpy(vbo_data, &vertex_list, vbo_size)

    buf_info := c3d.C3D_GetBufInfo()
    c3d.BufInfo_Init(buf_info)
    c3d.BufInfo_Add(buf_info, vbo_data, size_of(Vertex), 2, 0x10)

    env := c3d.C3D_GetTexEnv(0)
    c3d.C3D_TexEnvInit(env)
    c3d.C3D_TexEnvSrc(env, c3d.C3D_Both, .FRAGMENT_PRIMARY, .FRAGMENT_PRIMARY, .FRAGMENT_PRIMARY)
    c3d.C3D_TexEnvFunc(env, c3d.C3D_Both, .REPLACE)

    c3d.C3D_DepthMap(true, -1.0, 0.0)
    c3d.C3D_DepthTest(true, .GEQUAL, .ALL)
    c3d.C3D_CullFace(.NONE)

    // ── Lighting ──────────────────────────────────────────────────
    light_env: c3d.C3D_LightEnv
    lights:    [2]c3d.C3D_Light // adjacent on purpose: tests size_of(C3D_Light)
    lut_d0:    c3d.C3D_LightLut
    lut_spot:  c3d.C3D_LightLut
    lut_da:    c3d.C3D_LightLutDA

    c3d.C3D_LightEnvInit(&light_env)
    c3d.C3D_LightEnvBind(&light_env)

    c3d.LightLut_Phong(&lut_d0, 20.0)
    c3d.C3D_LightEnvLut(&light_env, .D0, .LN, false, &lut_d0)
    c3d.C3D_LightEnvAmbient(&light_env, 0.25, 0.25, 0.25)

    material := c3d.C3D_Material{
        ambient   = {1.0, 1.0, 1.0},
        diffuse   = {0.8, 0.8, 0.8},
        specular0 = {0.0, 0.0, 0.0},
        specular1 = {0.0, 0.0, 0.0},
        emission  = {0.0, 0.0, 0.0},
    }
    c3d.C3D_LightEnvMaterial(&light_env, &material)

    // Light 0: warm white spotlight at the camera.
    spot := &lights[0]
    spot_id := c3d.C3D_LightInit(spot, &light_env)
    c3d.C3D_LightDiffuse(spot, 1.0, 0.95, 0.8)
    c3d.C3D_LightAmbient(spot, 0.0, 0.0, 0.0)
    spot_pos := c3d.FVec4_New(0.0, 0.0, 0.0, 1.0)
    c3d.C3D_LightPosition(spot, &spot_pos)
    c3d.LightLut_Spotlight(&lut_spot, c3d.C3D_AngleFromDegrees(12.0))
    c3d.C3D_LightSpotLut(spot, &lut_spot)
    c3d.C3D_LightSpotEnable(spot, true)

    // Light 1: blue point light with quadratic distance attenuation.
    glow := &lights[1]
    glow_id := c3d.C3D_LightInit(glow, &light_env)
    c3d.C3D_LightDiffuse(glow, 0.2, 0.4, 1.0)
    c3d.C3D_LightAmbient(glow, 0.0, 0.0, 0.0)
    // attenuation = 1 / (1 + 0.3 d + 0.15 d^2), d from 0 to 10
    c3d.LightLutDA_Quadratic(&lut_da, 0.0, 10.0, 0.3, 0.15)
    c3d.C3D_LightDistAttn(glow, &lut_da)
    c3d.C3D_LightDistAttnEnable(glow, true)

    proj: c3d.C3D_Mtx
    c3d.Mtx_PerspTilt_Bridge(&proj, c3d.C3D_AngleFromDegrees(40.0), c3d.C3D_AspectRatioTop, 0.5, 100.0, false)

    // The model matrix is the identity: the wall is already in view space.
    model: c3d.C3D_Mtx
    c3d.Mtx_Identity(&model)

    ctru.printf("\x1b[1;1HSpotlight-Example")
    ctru.printf("\x1b[3;1Hsize_of(C3D_Light) = %d (expect 112)", i32(size_of(c3d.C3D_Light)))
    ctru.printf("\x1b[4;1Hlight ids: %d, %d (expect 0, 1)", spot_id, glow_id)
    ctru.printf("\x1b[5;1HLUT ids: SP=%d DA=%d (expect 2, 7)", i32(c3d.GPU_LIGHTLUTID.SP), i32(c3d.GPU_LIGHTLUTID.DA))
    ctru.printf("\x1b[13;1HPad: aim spotlight")
    ctru.printf("\x1b[14;1HA: blue light  X: attenuation")
    ctru.printf("\x1b[15;1HY: spot cone   START: exit")

    aim_x: f32 = 0.0
    aim_y: f32 = 0.0
    angle: f32 = 0.0
    glow_on := true
    attn_on := true
    cone_on := true

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        down := ctru.hidKeysDown()
        held := ctru.hidKeysHeld()
        if down & ctru.KEY_START != 0 do break

        if down & ctru.KEY_A != 0 {
            glow_on = !glow_on
            c3d.C3D_LightEnable(glow, glow_on)
        }
        if down & ctru.KEY_X != 0 {
            attn_on = !attn_on
            c3d.C3D_LightDistAttnEnable(glow, attn_on)
        }
        if down & ctru.KEY_Y != 0 {
            cone_on = !cone_on
            c3d.C3D_LightSpotEnable(spot, cone_on)
        }

        // Aim: circle pad, or the D-pad in steps.
        pad: ctru.circlePosition
        ctru.hidCircleRead(&pad)
        aim_x += f32(pad.dx) / 156.0 * 0.02
        aim_y += f32(pad.dy) / 156.0 * 0.02
        if held & ctru.KEY_DLEFT != 0 do aim_x -= 0.02
        if held & ctru.KEY_DRIGHT != 0 do aim_x += 0.02
        if held & ctru.KEY_DUP != 0 do aim_y += 0.02
        if held & ctru.KEY_DDOWN != 0 do aim_y -= 0.02
        aim_x = clamp(aim_x, -0.6, 0.6)
        aim_y = clamp(aim_y, -0.4, 0.4)
        c3d.C3D_LightSpotDir(spot, aim_x, aim_y, -1.0)
        // C3D_LightSpotDir may switch the spot on, so reapply the toggle.
        c3d.C3D_LightSpotEnable(spot, cone_on)

        // The blue light circles 1.5 units in front of the wall.
        angle += 0.02
        if angle >= c3d.C3D_TAU do angle -= c3d.C3D_TAU
        glow_pos := c3d.FVec4_New(2.5 * math.cos(angle), 1.5 * math.sin(angle), WALL_Z + 1.5, 1.0)
        c3d.C3D_LightPosition(glow, &glow_pos)

        ctru.printf("\x1b[7;1Hblue light:  %s", on_off(glow_on))
        ctru.printf("\x1b[8;1Hattenuation: %s", on_off(attn_on))
        ctru.printf("\x1b[9;1Hspot cone:   %s", on_off(cone_on))

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x203A80FF, 0)
        c3d.C3D_FrameDrawOn(top)

        mvp: c3d.C3D_Mtx
        c3d.Mtx_Multiply(&mvp, &proj, &model)
        c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uloc_mvp, &mvp)
        c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uloc_mv, &model)
        c3d.C3D_DrawArrays(.TRIANGLES, 0, 6)

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
