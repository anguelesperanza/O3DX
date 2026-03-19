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

bool load_t3x_image(const char* path, C3D_Tex* tex, Tex3DS_SubTexture* subtex) {
    FILE* f = fopen(path, "rb");
    if (!f) return false;

    fseek(f, 16, SEEK_SET);

    uint32_t width, height, fmt, data_size;
    if (fread(&width,     4, 1, f) != 1 ||
        fread(&height,    4, 1, f) != 1 ||
        fread(&fmt,       4, 1, f) != 1 ||
        fread(&data_size, 4, 1, f) != 1) {
        fclose(f);
        return false;
    }

    if (!C3D_TexInit(tex, (u16)width, (u16)height, GPU_RGBA8)) {
        fclose(f);
        return false;
    }

    size_t read = fread(tex->data, 1, data_size, f);
    fclose(f);

    if (read != data_size) {
        C3D_TexDelete(tex);
        return false;
    }

    GSPGPU_FlushDataCache(tex->data, tex->size);

    subtex->width  = (u16)width;
    subtex->height = (u16)height;
    subtex->left   = 0.0f;
    subtex->top    = 1.0f;
    subtex->right  = (float)width  / (float)tex->width;
    subtex->bottom = 0.0f;

    return true;
}
