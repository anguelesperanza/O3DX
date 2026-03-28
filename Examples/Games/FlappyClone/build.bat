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
set TARGET=FlappyClone
set BUILD=build
set SOURCES=source
set INCLUDES=include
set DATA=data
set GFX=gfx
set ROMFS=romfs
set GFXOUT=%ROMFS%\gfx
set AUDIOOUT=%ROMFS%\audio
set ODINASM=odin_asm
set IMAGES=assets\images
set AUDIO=assets\audio
:: Shared library root (relative to this example)
set LIB=..\..\..\lib
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
if not exist %GFXOUT% mkdir %GFXOUT%
mkdir %ODINASM%
echo.
echo === Building 3DS Project ===
echo.
:: -------------------------------
:: Convert images → .t3x  (searches assets\images recursively)
:: Folders that contain a .t3s file are built as atlases via tritex -a.
:: Individual image files inside those folders are skipped to avoid
:: generating duplicate single-frame .t3x files alongside the atlas.
:: -------------------------------
echo.
echo Converting images...
if not exist %GFXOUT% mkdir %GFXOUT%

:: Pass 1 — atlas folders: build every .t3s as a multi-sprite atlas.
set T3S_FOUND=0
for /r %IMAGES% %%t in (*.t3s) do (
    set T3S_FOUND=1
    echo  - %%t [atlas]
    tritex -a -o "%GFXOUT%\%%~nt.t3x" -i "%%t"
    if errorlevel 1 goto :fail
)
if "%T3S_FOUND%"=="0" echo  - No .t3s atlas files found, skipping pass 1.

:: Pass 2 — standalone images: convert each image that does NOT live in a
:: folder that already has a .t3s file (those are owned by pass 1).
set IMG_FOUND=0
for /r %IMAGES% %%f in (*.png *.jpg *.jpeg) do (
    set "IMG_DIR=%%~dpf"
    set "SKIP=0"
    for %%t in ("!IMG_DIR!*.t3s") do set "SKIP=1"
    if "!SKIP!"=="0" (
        set IMG_FOUND=1
        echo  - %%f
        tritex "%%f" "%GFXOUT%\%%~nf.t3x"
        if errorlevel 1 goto :fail
    )
)
if "%IMG_FOUND%"=="0" echo  - No standalone images found, skipping pass 2.
:: -------------------------------
:: Copy audio files → romfs\audio
:: -------------------------------
echo.
echo Copying audio...
set AUDIO_FOUND=0
for /r %AUDIO% %%f in (*.wav *.ogg *.mp3) do set AUDIO_FOUND=1
if "%AUDIO_FOUND%"=="1" (
    if not exist %AUDIOOUT% mkdir %AUDIOOUT%
    for /r %AUDIO% %%f in (*.wav *.ogg *.mp3) do (
        echo  - %%f
        copy /Y "%%f" "%AUDIOOUT%\%%~nxf" >nul
        if errorlevel 1 goto :fail
    )
) else (
    echo  - No audio found in %AUDIO%, skipping.
)
:: -------------------------------
:: Build Odin → assembly → object
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
    -I"%DEVKITPRO%\libctru\include" -I"%INCLUDES%" -D__3DS__
if errorlevel 1 goto :fail
:: -------------------------------
:: Compile shared library bridges
:: -------------------------------
echo.
echo Compiling lib bridges...
arm-none-eabi-gcc -c "%LIB%\ctru\bridge.c" -o "%BUILD%\ctru_bridge.o" ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
    -I"%DEVKITPRO%\libctru\include" -D__3DS__
if errorlevel 1 goto :fail
arm-none-eabi-gcc -c "%LIB%\c2d\bridge.c" -o "%BUILD%\c2d_bridge.o" ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
    -I"%DEVKITPRO%\libctru\include" -D__3DS__
if errorlevel 1 goto :fail
arm-none-eabi-gcc -c "%LIB%\c3d\bridge.c" -o "%BUILD%\c3d_bridge.o" ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
    -I"%DEVKITPRO%\libctru\include" -D__3DS__
if errorlevel 1 goto :fail
:: -------------------------------
:: Compile all C/C++/ASM source files
:: -------------------------------
echo.
echo Compiling sources...
for %%f in (%SOURCES%\*.c) do (
    echo  - %%f
    arm-none-eabi-gcc -c "%%f" -o "%BUILD%\%%~nf.o" ^
        -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
        -I"%DEVKITPRO%\libctru\include" -I"%INCLUDES%" -D__3DS__ -O2 -Wall
    if errorlevel 1 goto :fail
)
for %%f in (%SOURCES%\*.cpp) do (
    echo  - %%f
    arm-none-eabi-g++ -c "%%f" -o "%BUILD%\%%~nf.o" ^
        -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
        -I"%DEVKITPRO%\libctru\include" -I"%INCLUDES%" -D__3DS__ -O2 -Wall -std=gnu++11 -fno-rtti -fno-exceptions
    if errorlevel 1 goto :fail
)
for %%f in (%SOURCES%\*.s) do (
    echo  - %%f
    arm-none-eabi-as "%%f" -o "%BUILD%\%%~nf.o"
    if errorlevel 1 goto :fail
)
:: -------------------------------
:: Convert textures (.t3s → .t3x)
:: -------------------------------
echo.
echo Converting textures...
for %%f in (%GFX%\*.t3s) do (
    echo  - %%f
    tritex -i "%%f" -H "%GFXOUT%\%%~nf.h" -d "%GFXOUT%\%%~nf.d" -o "%GFXOUT%\%%~nf.t3x"
    if errorlevel 1 goto :fail
)
:: -------------------------------
:: Embed data files
:: -------------------------------
echo.
echo Embedding data files...
for %%f in (%DATA%\*) do (
    echo  - %%f
    bin2o "%%f" "%BUILD%\%%~nxf.o" "%%~nxf"
    if errorlevel 1 goto :fail
)
:: -------------------------------
:: Shader compilation
:: -------------------------------
echo.
echo Compiling shaders...
for %%f in (%SOURCES%\*.v.pica) do (
    echo  - %%f
    picasso -o "%BUILD%\%%~nf.shbin" "%%f"
    bin2s "%BUILD%\%%~nf.shbin" | arm-none-eabi-as -o "%BUILD%\%%~nf.shbin.o"
    if errorlevel 1 goto :fail
)
for %%f in (%SOURCES%\*.shlist) do (
    echo  - %%f
    set SHADERLIST=
    for /f "usebackq tokens=*" %%x in ("%%f") do (
        set SHADERLIST=!SHADERLIST! %SOURCES%\%%x
    )
    picasso -o "%BUILD%\%%~nf.shbin" !SHADERLIST!
    bin2s "%BUILD%\%%~nf.shbin" | arm-none-eabi-as -o "%BUILD%\%%~nf.shbin.o"
    if errorlevel 1 goto :fail
)
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
    -lcitro2d -lcitro3d -lctru -lm ^
    -specs=3dsx.specs ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft
if errorlevel 1 goto :fail
:: -------------------------------
:: Generate SMDH
:: -------------------------------
echo.
echo Generating SMDH...
if exist "assets\icon.png" (
    echo  - Using assets\icon.png
    smdhtool --create "%TARGET%" "%TARGET%" "AuthorName" "assets\icon.png" "%TARGET%.smdh"
) else (
    echo  - No assets\icon.png found, using default icon
    smdhtool --create "%TARGET%" "%TARGET%" "AuthorName" "%DEVKITPRO%\libctru\default_icon.png" "%TARGET%.smdh"
)
if errorlevel 1 goto :fail
:: -------------------------------
:: Convert ELF → 3DSX
:: -------------------------------
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
