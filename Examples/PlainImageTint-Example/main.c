// PlainImageTint-Example: entry point + image-loading utility.
// All ABI bridge functions live in lib/c2d/bridge.c and lib/c3d/bridge.c.

#include <citro2d.h>
#include <stdio.h>
#include <string.h>
#include "../../lib/bridge_utils.h"

extern int odin_main(int argc, char* argv[]);

int main(int argc, char* argv[]) {
    return odin_main(argc, argv);
}

// ----------------------------------------------------------------
// load_t3x_image
// Parses a Tex3DS .t3x file using Tex3DS_TextureImportStdio,
// uploads the texture to GPU memory, and fills out the first
// sub-texture entry.  Returns true on success.
// Call C3D_TexDelete(tex) when done.
// ----------------------------------------------------------------
bool load_t3x_image(const char* path, C3D_Tex* tex, Tex3DS_SubTexture* subtex) {
    FILE* f = fopen(path, "rb");
    if (!f) return false;
    Tex3DS_Texture t3x = Tex3DS_TextureImportStdio(f, tex, NULL, false);
    fclose(f);
    if (!t3x) return false;
    if (Tex3DS_GetNumSubTextures(t3x) == 0) {
        Tex3DS_TextureFree(t3x);
        return false;
    }
    *subtex = *Tex3DS_GetSubTexture(t3x, 0);
    Tex3DS_TextureFree(t3x);
    return true;
}
