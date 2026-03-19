@echo off
setlocal

set DEVKITPRO=C:\devkitPro
set DEVKITARM=%DEVKITPRO%\devkitARM
set PATH=%DEVKITARM%\bin;%DEVKITPRO%\tools\bin;%PATH%

echo Compiling main.c...
arm-none-eabi-gcc -c main.c -o main.o ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
    -I"%DEVKITPRO%\libctru\include"

if errorlevel 1 goto :fail

echo Linking ELF...
arm-none-eabi-gcc -o app.elf main.o ^
    -L"%DEVKITPRO%\libctru\lib" ^
    -lcitro2d -lcitro3d -lctru -lm ^
    -specs=3dsx.specs ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft

if errorlevel 1 goto :fail

echo Converting to 3DSX...
3dsxtool app.elf app.3dsx

if errorlevel 1 goto :fail

echo Build successful! Output: app.3dsx
exit /b 0

:fail
echo Build FAILED!
exit /b 1
