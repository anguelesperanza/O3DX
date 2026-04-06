@echo off
setlocal enabledelayedexpansion
:: ---------------------------------------------------------------
:: Configure devkitPro paths
:: ---------------------------------------------------------------
set DEVKITPRO=C:\devkitPro
set DEVKITARM=%DEVKITPRO%\devkitARM
set PATH=%DEVKITARM%\bin;%DEVKITPRO%\tools\bin;%PATH%
:: ---------------------------------------------------------------
:: Tool paths — local copies relative to the repo root.
::
:: To use PATH-installed versions instead, change these to:
::   set TRITEX=tritex
::   set MP3TOWAV=mp3towav
:: ---------------------------------------------------------------
set TRITEX=..\..\tools\tritex.exe
set MP3TOWAV=..\..\tools\mp3towav.exe
:: ---------------------------------------------------------------
:: Project settings
:: ---------------------------------------------------------------
set TARGET=Camera-Example
:: ---------------------------------------------------------------
:: Folder layout
:: ---------------------------------------------------------------
set BUILD=build
set ROMFS=romfs
set GFXOUT=%ROMFS%\gfx
set AUDIOOUT=%ROMFS%\audio
set ODINASM=odin_asm
set IMAGES=assets\images
set AUDIO=assets\audio
set LIB=..\..\lib
:: ---------------------------------------------------------------
:: Clean previous build
:: ---------------------------------------------------------------
if exist %BUILD%   rd /s /q %BUILD%
if exist %ODINASM% rd /s /q %ODINASM%
:: ---------------------------------------------------------------
:: Create output folders
:: ---------------------------------------------------------------
mkdir %BUILD%
if not exist %ROMFS%    mkdir %ROMFS%
if not exist %GFXOUT%   mkdir %GFXOUT%
if not exist %AUDIOOUT% mkdir %AUDIOOUT%
mkdir %ODINASM%
echo.
echo === Building Camera-Example ===
echo.
:: Image conversion (atlas pass1 + standalone pass2)
echo Converting images...
set T3S_FOUND=0
for /r %IMAGES% %%t in (*.t3s) do (
    set T3S_FOUND=1
    echo  - %%t [atlas]
    "%TRITEX%" -a -o "%GFXOUT%\%%~nt.t3x" -i "%%t"
    if errorlevel 1 goto :fail
)
if "%T3S_FOUND%"=="0" echo  - No .t3s atlas files found.
set IMG_FOUND=0
for /r %IMAGES% %%f in (*.png *.jpg *.jpeg) do (
    set "IMG_DIR=%%~dpf"
    set "SKIP=0"
    for %%t in ("!IMG_DIR!*.t3s") do set "SKIP=1"
    if "!SKIP!"=="0" (
        set IMG_FOUND=1
        echo  - %%f
        "%TRITEX%" "%%f" "%GFXOUT%\%%~nf.t3x"
        if errorlevel 1 goto :fail
    )
)
if "%IMG_FOUND%"=="0" echo  - No standalone images found.
:: MP3->WAV conversion
echo.
echo Converting MP3 audio...
set MP3_FOUND=0
for /r %AUDIO% %%f in (*.mp3) do set MP3_FOUND=1
if "%MP3_FOUND%"=="1" (
    for /r %AUDIO% %%f in (*.mp3) do (
        echo  - %%f
        "%MP3TOWAV%" "%%f" "%AUDIO%\%%~nf.wav"
        if errorlevel 1 goto :fail
    )
) else (
    echo  - No MP3 files found, skipping.
)
:: Copy audio
echo.
echo Copying audio...
set AUDIO_FOUND=0
for /r %AUDIO% %%f in (*.wav *.ogg) do set AUDIO_FOUND=1
if "%AUDIO_FOUND%"=="1" (
    for /r %AUDIO% %%f in (*.wav *.ogg) do (
        echo  - %%f
        copy /Y "%%f" "%AUDIOOUT%\%%~nxf" >nul
        if errorlevel 1 goto :fail
    )
) else (
    echo  - No audio found in %AUDIO%, skipping.
)
:: Odin -> assembly
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
:: Compile main.c
echo.
echo Compiling main.c...
arm-none-eabi-gcc -c main.c -o "%BUILD%\main.o" ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft ^
    -I"%DEVKITPRO%\libctru\include" -D__3DS__
if errorlevel 1 goto :fail
:: Bridges
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
:: Link
set OBJ=
for %%f in (%BUILD%\*.o) do set OBJ=!OBJ! %%f
echo.
echo Linking ELF...
arm-none-eabi-gcc -o "app.elf" %OBJ% ^
    -L"%DEVKITPRO%\libctru\lib" ^
    -lcitro2d -lcitro3d -lctru -lm ^
    -specs=3dsx.specs ^
    -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft
if errorlevel 1 goto :fail
:: SMDH
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
:: 3DSX
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
