// Audio-Example: entry point only.
// All ABI bridge functions live in lib/ctru/bridge.c.

#include <3ds.h>

extern int odin_main(int argc, char* argv[]);

int main(int argc, char* argv[]) {
    return odin_main(argc, argv);
}
