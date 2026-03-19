// ViewScale-Example: entry point only.
// All ABI bridge functions live in lib/c2d/bridge.c and lib/c3d/bridge.c.

#include <citro2d.h>
#include "../../lib/bridge_utils.h"

extern int odin_main(int argc, char* argv[]);

int main(int argc, char* argv[]) {
    return odin_main(argc, argv);
}
