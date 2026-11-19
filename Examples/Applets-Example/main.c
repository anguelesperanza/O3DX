// C entry point: hands over to odin_main in main.odin.
// All ABI bridge functions live in lib/*/bridge.c.

extern int odin_main(int argc, char* argv[]);

int main(int argc, char* argv[]) {
    return odin_main(argc, argv);
}
