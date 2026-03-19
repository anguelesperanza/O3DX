### POC Example

This is the POC Example that shows that Odin can create a 3DS application

to run this run `build.bat`, take the created .3dsx file and load it into Citra

How this works is a little non standard compared to usual odin code.

## build.bat

There's a lot going on in build.bat so let me explain it here.

1) Checks if DevKitPro 3DS toolchain is installed
  - 3ds.h
2) Build the odin file using the following build arguments
  - target: freestanding_arm32 (3DS is a arm32 based CPU)
  - o: Speed
  - build mode: asm (Build arm32 assembly that will be compiled by DevKitPro)
  - no entry point (Odin procedures will be used as FFI for main.c)
  - min link libs
  - no thread local
3) Creates odin_asm directory if one does not exist
4) move all of the .odin.s files into odin_asm
5) Call make
6) Clean up the directory and remove odin_asm file


