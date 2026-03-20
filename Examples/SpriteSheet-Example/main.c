// SpriteSheet-Example: entry point.
// All ABI bridge functions live in lib/c2d/bridge.c and lib/c3d/bridge.c.
// Texture loading is handled entirely by C2D_SpriteSheetLoad (Tex3DS parser)
// so no custom load_t3x_image helper is needed here.

#include <citro2d.h>
#include "../../lib/bridge_utils.h"

extern int odin_main(int argc, char* argv[]);

int main(int argc, char* argv[]) {
    return odin_main(argc, argv);
}
