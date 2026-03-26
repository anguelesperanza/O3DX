@echo off
setlocal enabledelayedexpansion
:: -------------------------------
:: Configure devkitPro paths
:: -------------------------------
set DEVKITPRO=C:\devkitPro
set DEVKITARM=%DEVKITPRO%\devkitARM
set PATH=%DEVKITARM%\bin;%DEVKITPRO%\tools\bin;%PATH%
:: -------------------------------
:: Project folders
:: -------------------------------
set TARGET=%~nX0
set BUILD=build
set ROMFS=romfs
set ODINASM=odin_asm
:: Shared library root (relative to this example)
set LIB=..\..\lib
:: -------------------------------
:: Clean previous build
:: -------------------------------
if exist %BUILD%   rd /s /q %BUILD%
if exist %ODINASM% rd /s /q %ODINASM%
:: -------------------------------
:: Create folders
:: -------------------------------
mkdir %BUILD%
if not exist %ROMFS% mkdir %ROMFS%
mkdir %ODINASM%
echo.
echo === Building Audio-Example ===
echo.
:: -------------------------------
:: Build Odin -> assembly -> object
:: -------------------------------
echo Building Odin assembly...
odin build . -target:freestanding_arm32 -o:speed -build-mode:asm -no-entry-point -min-link-libs -no-thread-local
if errorlevel 1 goto :fail
echo Moving Odin assembly files...
for %%f in (*.S) do (
    ren "%%f" "%%~nf.odin.s"
    move "%%~nf.odin.s" "%ODINASM%\"
)
echo Compiling Odin assembly...
for %%f in (%ODINASM%\*.odin.s) do (
    echo  - %%f
    arm-none-eabi-gcc -c "%%f" -o "%BUILD%\%%~nf.o" ^
        -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft
    if errorlevel 1 goto :fail
)
:: -------------------------------
:: Compile main.c entry shim
:: -------------------------------
echo.
echo Compiling main.c...
arm-none-eabi-gcc -c main.c -o "%BUILD%\main.o" ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
    -I"%DEVKITPRO%\libctru\include" -D__3DS__
if errorlevel 1 goto :fail
:: -------------------------------
:: Compile ctru bridge (ndsp float wrappers, romfs, irrst)
:: -------------------------------
echo.
echo Compiling ctru bridge...
arm-none-eabi-gcc -c "%LIB%\ctru\bridge.c" -o "%BUILD%\ctru_bridge.o" ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
    -I"%DEVKITPRO%\libctru\include" -D__3DS__
if errorlevel 1 goto :fail
:: -------------------------------
:: Collect all object files
:: -------------------------------
set OBJ=
for %%f in (%BUILD%\*.o) do set OBJ=!OBJ! %%f
:: -------------------------------
:: Link ELF
:: -------------------------------
echo.
echo Linking ELF...
arm-none-eabi-gcc -o "app.elf" %OBJ% ^
    -L"%DEVKITPRO%\libctru\lib" ^
    -lctru -lm ^
    -specs=3dsx.specs ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft
if errorlevel 1 goto :fail
:: -------------------------------
:: Generate SMDH
:: -------------------------------
echo.
echo Generating SMDH...
smdhtool --create "Audio-Example" "Audio-Example" "Anguel" ^
    "%DEVKITPRO%\libctru\default_icon.png" "%TARGET%.smdh"
if errorlevel 1 goto :fail
:: -------------------------------
:: Convert ELF -> 3DSX (with romfs for audio.wav)
:: -------------------------------
echo.
echo Creating 3DSX...
3dsxtool "app.elf" "app.3dsx" --smdh="%TARGET%.smdh" --romfs="%ROMFS%"
echo.
echo Build complete: app.3dsx
echo.
echo NOTE: Place your audio.wav in the romfs\ folder before running.
echo       The file must be an uncompressed PCM WAV (8 or 16 bit, mono or stereo).
echo       Optionally place dspfirm.cdc in romfs\ if ndspInit fails.
exit /b 0
:fail
echo.
echo Build FAILED!
exit /b 1
