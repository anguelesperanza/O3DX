// ProcTex-Example: C entry-point shim.
#include <citro3d.h>
#include "../../lib/bridge_utils.h"

extern int odin_main(int argc, char* argv[]);

int main(int argc, char* argv[]) {
    return odin_main(argc, argv);
}
