@echo off
setlocal enabledelayedexpansion
set DEVKITPRO=C:\devkitPro
set DEVKITARM=%DEVKITPRO%\devkitARM
set PATH=%DEVKITARM%\bin;%DEVKITPRO%\tools\bin;%PATH%
set TARGET=Scale-Example
set BUILD=build
set ROMFS=romfs
set ODINASM=odin_asm
set LIB=..\..\lib
if exist %BUILD%   rd /s /q %BUILD%
if exist %ODINASM% rd /s /q %ODINASM%
mkdir %BUILD%
if not exist %ROMFS% mkdir %ROMFS%
mkdir %ODINASM%
echo.
echo === Building Scale-Example ===
echo.
echo Compiling vertex shader...
picasso -o "%ROMFS%\vshader.shbin" "vshader.v.pica"
if errorlevel 1 goto :fail
echo.
echo Building Odin assembly...
odin build . -target:freestanding_arm32 -o:speed -build-mode:asm -no-entry-point -min-link-libs -no-thread-local
if errorlevel 1 goto :fail
for %%f in (*.S) do (
    ren "%%f" "%%~nf.odin.s"
    move "%%~nf.odin.s" "%ODINASM%\"
)
for %%f in (%ODINASM%\*.odin.s) do (
    echo  - %%f
    arm-none-eabi-gcc -c "%%f" -o "%BUILD%\%%~nf.o" ^
        -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft
    if errorlevel 1 goto :fail
)
echo.
echo Compiling main.c...
arm-none-eabi-gcc -c main.c -o "%BUILD%\main.o" ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
    -I"%DEVKITPRO%\libctru\include" -D__3DS__
if errorlevel 1 goto :fail
echo.
echo Compiling lib bridges...
arm-none-eabi-gcc -c "%LIB%\ctru\bridge.c" -o "%BUILD%\ctru_bridge.o" ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
    -I"%DEVKITPRO%\libctru\include" -D__3DS__
if errorlevel 1 goto :fail
arm-none-eabi-gcc -c "%LIB%\c3d\bridge.c" -o "%BUILD%\c3d_bridge.o" ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
    -I"%DEVKITPRO%\libctru\include" ^
    -I"%DEVKITPRO%\libctru\include\c3d" -D__3DS__
if errorlevel 1 goto :fail
set OBJ=
for %%f in (%BUILD%\*.o) do set OBJ=!OBJ! %%f
echo.
echo Linking ELF...
arm-none-eabi-gcc -o "app.elf" %OBJ% ^
    -L"%DEVKITPRO%\libctru\lib" ^
    -lcitro3d -lctru -lm ^
    -specs=3dsx.specs ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft
if errorlevel 1 goto :fail
echo.
echo Generating SMDH...
smdhtool --create "%TARGET%" "%TARGET%" "Anguel" ^
    "%DEVKITPRO%\libctru\default_icon.png" "%TARGET%.smdh"
if errorlevel 1 goto :fail
echo.
echo Creating 3DSX...
3dsxtool "app.elf" "app.3dsx" --smdh="%TARGET%.smdh" --romfs="%ROMFS%"
echo.
echo Build complete: app.3dsx
exit /b 0
:fail
echo.
echo Build FAILED!
exit /b 1
