#!/usr/bin/env python3
"""Regenerate lib/libm/redefine.syms.

    python tools/gen_libm_syms.py      (from the repo root)

build.bat renames these symbols inside the Odin object only
(objcopy --redefine-syms), from `name` to `o3dx_name`. The bridges in
lib/c2d, lib/c3d and lib/ctru, and citro2d / citro3d / libctru themselves,
keep calling the real functions.

Why every name and not just the bridged ones: all of these functions take or
return float/double, and devkitARM's copies (armv6k/fpu multilib) expect them
in VFP registers while Odin passes them in integer registers. A direct call
links and silently returns garbage. With the rename, a function that
lib/libm/bridge.c does not wrap fails at link time with
"undefined reference to `o3dx_<name>'", which says exactly what to add to
bridge.c.

The list is: every public function in newlib's libm.a, plus the libgcc helpers
LLVM calls for float <-> 64-bit integer conversion and friends.

Adapted from vito's tools/gen_libm_syms.py.
"""
import os
import re
import subprocess

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, ".."))
DEVKITARM = os.environ.get("DEVKITARM", "")
# devkitPro sets DEVKITARM to an msys path (/opt/devkitpro/devkitARM) that
# Windows Python cannot open; fall back to the default install location.
if not os.path.isdir(DEVKITARM):
    DEVKITARM = r"C:\devkitPro\devkitARM"
NM = os.path.join(DEVKITARM, "bin", "arm-none-eabi-nm")
LIBM = os.path.join(DEVKITARM, "arm-none-eabi", "lib", "armv6k", "fpu", "libm.a")

# libgcc routines with a float or double argument or result.
LIBGCC = """__fixdfdi __fixsfdi __fixunsdfdi __fixunssfdi __floatdidf __floatdisf __floatundidf
__floatundisf __fixdfsi __fixsfsi __fixunsdfsi __fixunssfsi __floatsidf __floatsisf __floatunsidf
__floatunsisf __extendsfdf2 __truncdfsf2 __powidf2 __powisf2 __muldc3 __mulsc3 __divdc3 __divsc3
__gnu_h2f_ieee __gnu_f2h_ieee __gnu_d2h_ieee __extendhfsf2 __truncsfhf2 __truncdfhf2""".split()

# fenv functions only take integers and pointers: safe to call directly.
SKIP = re.compile(r"^(fe[a-z]+|_.*)$")


def main():
    out = subprocess.run([NM, LIBM], capture_output=True, text=True).stdout
    names = set()
    for ln in out.splitlines():
        m = re.match(r"^[0-9a-f]+ [TW] (\w+)$", ln)
        if m and not SKIP.match(m.group(1)):
            names.add(m.group(1))
    names = sorted(names) + LIBGCC
    path = os.path.join(ROOT, "lib", "libm", "redefine.syms")
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", newline="\n") as f:
        for n in names:
            f.write(f"{n} o3dx_{n}\n")
    print(f"{len(names)} symbols -> {path}")


if __name__ == "__main__":
    main()
