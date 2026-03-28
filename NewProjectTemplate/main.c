// C entry point — forwards to Odin game_main.
// Do not modify this file unless you need to call C libraries before Odin starts.

extern int odin_main(int argc, char* argv[]);

int main(int argc, char* argv[]) {
    return odin_main(argc, argv);
}
