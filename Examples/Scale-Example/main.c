// FlappyClone: C entry point.
// All ABI bridge functions live in lib/c2d/bridge.c and lib/c3d/bridge.c.

extern int odin_main(int argc, char* argv[]);

int main(int argc, char* argv[]) {
    return odin_main(argc, argv);
}
