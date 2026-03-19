// Shapes-Example: entry point shim.
// All ABI bridge functions now live in lib/c2d/bridge.c and lib/c3d/bridge.c.
// This file only provides the C main() that calls the Odin entry point.

#include <citro2d.h>
#include "../../lib/bridge_utils.h"

extern int odin_main(int argc, char* argv[]);

int main(int argc, char* argv[]) {
    return odin_main(argc, argv);
}
