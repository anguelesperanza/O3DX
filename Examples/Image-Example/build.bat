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
set SOURCES=source
set INCLUDES=include
set DATA=data
set GFX=gfx
set ROMFS=romfs
set GFXOUT=%ROMFS%\gfx
set ODINASM=odin_asm
set PNG_IMAGES=png_images
set PNG2T3X=C:\Users\King-\odin-projects\3dsLib\tools\png2t3x.exe
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
:: Convert PNG images → .t3x
:: -------------------------------
echo.
echo Converting PNG images...
set IMG_FOUND=0
for %%f in (%PNG_IMAGES%\*.png %PNG_IMAGES%\*.jpg %PNG_IMAGES%\*.jpeg) do set IMG_FOUND=1
if "%IMG_FOUND%"=="1" (
    if not exist %ROMFS% mkdir %ROMFS%
    for %%f in (%PNG_IMAGES%\*.png %PNG_IMAGES%\*.jpg %PNG_IMAGES%\*.jpeg) do (
        echo  - %%f
        "%PNG2T3X%" "%%f" "%ROMFS%\%%~nf.t3x"
        if errorlevel 1 goto :fail
    )
) else (
    echo  - No images found in %PNG_IMAGES%, skipping.
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
:: Compile all C/C++/ASM files
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
    tex3ds -i "%%f" -H "%GFXOUT%\%%~nf.h" -d "%GFXOUT%\%%~nf.d" -o "%GFXOUT%\%%~nf.t3x"
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
smdhtool --create "%TARGET%" "%TARGET%" "Anguel" ^
    "%DEVKITPRO%\libctru\default_icon.png" "%TARGET%.smdh"
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
