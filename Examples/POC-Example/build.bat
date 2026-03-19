@echo off
setlocal enabledelayedexpansion

:: Configure devkitPro paths
set DEVKITPRO=C:\devkitPro
set DEVKITARM=%DEVKITPRO%\devkitARM
set PATH=%DEVKITARM%\bin;%DEVKITPRO%\tools\bin;%PATH%

:: Create output directory if missing
if not exist output mkdir output

echo Cleaning old build...
if exist build rd /s /q build
if exist odin_asm rd /s /q odin_asm
mkdir build
mkdir odin_asm

echo Building Odin assembly...
odin build . -target:freestanding_arm32 -o:speed -build-mode:asm -no-entry-point -min-link-libs -no-thread-local
if errorlevel 1 goto :fail

echo Moving Odin assembly files...
for %%f in (*.S) do (
    ren "%%f" "%%~nf.odin.s"
    move "%%~nf.odin.s" "odin_asm\"
)

echo Compiling C code...
arm-none-eabi-gcc -c main.c -o build/main.o ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
    -I"%DEVKITPRO%\libctru\include"
if errorlevel 1 goto :fail

echo Compiling Odin assembly...
for %%f in (odin_asm\*.odin.s) do (
    arm-none-eabi-gcc -c "%%f" -o "build/%%~nf.o" ^
        -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft
    if errorlevel 1 goto :fail
)

echo Linking ELF...
arm-none-eabi-gcc -o output\POC-Example.elf ^
    build\*.o ^
    -L"%DEVKITPRO%\libctru\lib" ^
    -lctru -lcitro2d -lcitro3d -lm ^
    -specs=3dsx.specs ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft
if errorlevel 1 goto :fail

echo Converting to 3DSX...
3dsxtool output\POC-Example.elf output\POC-Example.3dsx
if errorlevel 1 goto :fail

echo Build successful!
exit /b 0

:fail
echo Build FAILED!
exit /b 1


# @echo off
# setlocal enabledelayedexpansion

# @echo off
# setlocal enabledelayedexpansion

# # set DEVKITARM=C:\devkitPro\devkitARM
# # set PATH=%DEVKITARM%\bin;%PATH%


# set DEVKITPRO=C:\devkitPro
# set DEVKITARM=%DEVKITPRO%\devkitARM
# set PATH=%DEVKITARM%\bin;%DEVKITPRO%\tools\bin;%PATH%



# echo Cleaning old build...
# if exist build rd /s /q build
# if exist odin_asm rd /s /q odin_asm
# mkdir build
# mkdir odin_asm

# echo Building Odin assembly...
# odin build . -target:freestanding_arm32 -o:speed -build-mode:asm -no-entry-point -min-link-libs -no-thread-local
# if errorlevel 1 goto :fail

# echo Moving Odin assembly files...
# for %%f in (*.S) do (
#     ren "%%f" "%%~nf.odin.s"
#     move "%%~nf.odin.s" "odin_asm\"
# )

# echo Compiling C code...
# arm-none-eabi-gcc -c main.c -o build/main.o ^
#     -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
#     -I"C:/devkitPro/libctru/include"
# if errorlevel 1 goto :fail

# echo Compiling Odin assembly...
# for %%f in (odin_asm\*.odin.s) do (
#     arm-none-eabi-gcc -c "%%f" -o "build/%%~nf.o" ^
#         -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft
#     if errorlevel 1 goto :fail
# )

# echo Linking ELF...
# arm-none-eabi-gcc -o POC-Example.elf ^
#     build\*.o ^
#     -L"C:/devkitPro/libctru/lib" ^
#     -lctru -lcitro2d -lcitro3d -lm ^
#     -specs=3dsx.specs ^
#     -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft
# if errorlevel 1 goto :fail

# echo Converting to 3DSX...
# 3dsxtool POC-Example.elf POC-Example.3dsx
# if errorlevel 1 goto :fail

# echo Build successful!
# exit /b 0

# :fail
# echo Build FAILED!
# exit /b 1
