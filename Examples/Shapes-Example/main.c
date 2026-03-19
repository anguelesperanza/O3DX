#include <citro2d.h>
#include <string.h>

extern int odin_main(int argc, char* argv[]);

int main(int argc, char* argv[]) {
    return odin_main(argc, argv);
}

// Reinterpret u32 bits as float without UB
static inline float u2f(uint32_t v) { float f; memcpy(&f, &v, 4); return f; }
// Reinterpret float bits as u32 (for return values)
static inline uint32_t f2u(float f)  { uint32_t v; memcpy(&v, &f, 4); return v; }

// -------------------------------------------------------
// Scene
// -------------------------------------------------------
void c2d_scene_begin(C3D_RenderTarget* target) {
    C2D_SceneBegin(target);
}

// -------------------------------------------------------
// Timer returns: hard-float puts result in s0,
// soft-float Odin expects it in r0.
// Wrapper returns uint32_t so the bits land in r0.
// -------------------------------------------------------
uint32_t c3d_get_processing_time(void) { return f2u(C3D_GetProcessingTime()); }
uint32_t c3d_get_drawing_time(void)    { return f2u(C3D_GetDrawingTime()); }
uint32_t c3d_get_cmdbuf_usage(void)    { return f2u(C3D_GetCmdBufUsage()); }

// -------------------------------------------------------
// Draw functions: ABI bridge soft-float → hard-float.
// Odin (soft-float) passes f32 bit patterns in general
// registers. C (hard-float) receives them as uint32_t,
// then reinterprets and forwards to the real functions.
// -------------------------------------------------------

bool c2d_draw_triangle(
    uint32_t ax, uint32_t ay, uint32_t clr0,
    uint32_t bx, uint32_t by, uint32_t clr1,
    uint32_t cx, uint32_t cy, uint32_t clr2,
    uint32_t depth)
{
    return C2D_DrawTriangle(
        u2f(ax), u2f(ay), clr0,
        u2f(bx), u2f(by), clr1,
        u2f(cx), u2f(cy), clr2,
        u2f(depth));
}

bool c2d_draw_rectangle(
    uint32_t x, uint32_t y, uint32_t z, uint32_t w, uint32_t h,
    uint32_t clr0, uint32_t clr1, uint32_t clr2, uint32_t clr3)
{
    return C2D_DrawRectangle(
        u2f(x), u2f(y), u2f(z), u2f(w), u2f(h),
        clr0, clr1, clr2, clr3);
}

bool c2d_draw_ellipse(
    uint32_t x, uint32_t y, uint32_t z, uint32_t w, uint32_t h,
    uint32_t clr0, uint32_t clr1, uint32_t clr2, uint32_t clr3)
{
    return C2D_DrawEllipse(
        u2f(x), u2f(y), u2f(z), u2f(w), u2f(h),
        clr0, clr1, clr2, clr3);
}

bool c2d_draw_circle(
    uint32_t x, uint32_t y, uint32_t z, uint32_t radius,
    uint32_t clr0, uint32_t clr1, uint32_t clr2, uint32_t clr3)
{
    return C2D_DrawCircle(
        u2f(x), u2f(y), u2f(z), u2f(radius),
        clr0, clr1, clr2, clr3);
}

bool c2d_draw_circle_solid(
    uint32_t x, uint32_t y, uint32_t z, uint32_t radius, uint32_t clr)
{
    return C2D_DrawCircleSolid(u2f(x), u2f(y), u2f(z), u2f(radius), clr);
}
