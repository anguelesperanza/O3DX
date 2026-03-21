// Texture-Example: entry point.
// All logic lives in main.odin; this file is a pure C shim.

#include <citro3d.h>
#include "../../lib/bridge_utils.h"

extern int odin_main(int argc, char* argv[]);

int main(int argc, char* argv[]) {
    return odin_main(argc, argv);
}
