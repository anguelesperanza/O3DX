package runtime_example

// Checks that ordinary Odin works on the 3DS once lib/o3dx is set up:
// the heap, dynamic arrays, maps, strings, fmt, strconv, sort, core:log,
// the temp allocator, math, a second thread with its own context, atomics,
// and a failing assertion.
//
// Each test prints PASS or FAIL on the top screen; the bottom screen is the
// console, where o3dx.printf and core:log write.
//   Y      fail an assertion on purpose: the message goes to the console and
//          sdmc:/o3dx_panic.log, then the app exits to the Homebrew Launcher
//          (panic_action = .EXIT; the library default, .TRAP, shows Luma3DS's
//          exception screen instead)
//   START  exit
//
// Ported from vito's Examples/Runtime-Example (PS Vita).

import "base:intrinsics"
import "base:runtime"
import "core:fmt"
import "core:log"
import "core:math"
import "core:math/linalg"
import "core:slice"
import "core:strconv"
import "core:strings"

import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"
import ctru "../../lib/ctru"
import o3dx "../../lib/o3dx"

Result :: struct {
    name:   string,
    ok:     bool,
    detail: string, // allocated on the heap, lives for the whole run
}

results: [dynamic]Result

report :: proc(name: string, ok: bool, format: string, args: ..any) {
    detail := fmt.aprintf(format, ..args)
    append(&results, Result{name, ok, detail})
    o3dx.printf("%s %s: %s\n", pass_fail(ok), name, detail)
}

pass_fail :: proc(ok: bool) -> cstring {
    if ok do return "PASS"
    return "FAIL"
}

Enemy :: struct {
    id: int,
    hp: f32,
}

// ---------------------------------------------------------------
// Worker thread: allocates on the shared heap and bumps an atomic counter.
// ---------------------------------------------------------------
THREAD_LOOPS :: 20000

shared_counter: i32 // atomic
worker_sum:     i64 // written once by the worker before it exits
worker_done:    i32 // atomic flag

worker :: proc "c" (arg: rawptr) {
    context = o3dx.thread_context()
    nums := make([dynamic]i64)
    defer delete(nums)
    for i in 0 ..< THREAD_LOOPS {
        append(&nums, i64(i))
        intrinsics.atomic_add(&shared_counter, 1)
    }
    sum: i64
    for n in nums do sum += n
    worker_sum = sum
    intrinsics.atomic_store(&worker_done, 1)
}

run_tests :: proc() {
    // 1. new / free
    {
        p := new(Enemy)
        ok := p != nil
        if ok {
            p.id = 7
            ok = p.id == 7 && p.hp == 0
            free(p)
        }
        report("new/free", ok, "pointer %p", p)
    }

    // 2. dynamic array of structs
    {
        enemies := make([dynamic]Enemy)
        defer delete(enemies)
        for i in 0 ..< 1000 do append(&enemies, Enemy{id = i, hp = f32(i) * 0.5})
        total := 0
        for e in enemies do total += e.id
        report("[dynamic]", len(enemies) == 1000 && total == 499500, "len %d sum %d", len(enemies), total)
    }

    // 3. map
    {
        scores := make(map[string]int)
        defer delete(scores)
        scores["a"] = 10
        scores["b"] = 20
        scores["x"] = 30
        scores["a"] += 5
        v, found := scores["a"]
        _, missing := scores["y"]
        report("map", found && v == 15 && !missing && len(scores) == 3, "a=%d len=%d", v, len(scores))
    }

    // 4. strings.Builder and fmt
    {
        sb := strings.builder_make()
        defer strings.builder_destroy(&sb)
        strings.write_string(&sb, "hp=")
        fmt.sbprintf(&sb, "%d/%d %s", 42, 100, "ok")
        s := strings.to_string(sb)
        report("strings.Builder", s == "hp=42/100 ok", "%q", s)
    }

    // 5. float formatting (goes through the libgcc helpers in lib/libm)
    {
        s := fmt.tprintf("%.3f %.1f", 3.14159, f32(-2.5))
        report("fmt floats", s == "3.142 -2.5", "%q", s)
    }

    // 6. strconv
    {
        i, i_ok := strconv.parse_int("-1234")
        f, f_ok := strconv.parse_f64("2.5")
        report("strconv", i_ok && f_ok && i == -1234 && f == 2.5, "%d %v", i, f)
    }

    // 7. sort
    {
        xs := []int{5, 3, 9, 1, 7}
        slice.sort(xs)
        report("slice.sort", slice.is_sorted(xs) && xs[0] == 1 && xs[4] == 9, "%v", xs)
    }

    // 8. aligned allocation
    {
        ptr, err := runtime.mem_alloc(1000, 64)
        addr := uintptr(raw_data(ptr))
        zeroed := true
        for b in ptr do zeroed &&= b == 0
        report("align 64", err == nil && addr % 64 == 0 && zeroed, "addr %p", raw_data(ptr))
        runtime.mem_free(raw_data(ptr))
    }

    // 9. a large allocation
    {
        big := make([]u8, 8 * runtime.Megabyte)
        ok := len(big) == 8 * runtime.Megabyte
        if ok {
            big[len(big) - 1] = 0xAB
            ok = big[len(big) - 1] == 0xAB
        }
        delete(big)
        report("8 MiB alloc", ok, "len %d", len(big))
    }

    // 10. core:math, linalg, and float <-> i64 conversion
    {
        s := math.sin(f32(math.PI) / 6)                     // 0.5
        a := linalg.matrix4_translate(linalg.Vector3f32{1, 2, 3})
        b := linalg.matrix4_scale(linalg.Vector3f32{2, 2, 2})
        v := (a * b) * linalg.Vector4f32{1, 1, 1, 1}       // (3, 4, 5, 1)
        l := linalg.length(linalg.Vector3f32{3, 4, 0})      // 5
        big := i64(f64(l) * 1e9)                            // __fixdfdi
        ok := abs(s - 0.5) < 0.0001 && v == {3, 4, 5, 1} && abs(l - 5) < 0.0001 && big == 5_000_000_000
        report("math/linalg", ok, "sin=%.4f len=%.1f i64=%d", s, l, big)
    }

    // 11. core:log (look for the line on the bottom screen)
    {
        log.infof("core:log works, %d results so far", len(results))
        report("core:log", context.logger.procedure != nil, "see the console")
    }

    // 12. a second thread: its own context, the shared heap, atomics
    {
        th := ctru.threadCreate(worker, nil, 64 * 1024, 0x31, -2, false)
        ok := th != nil
        if ok {
            // Race the worker on the same counter and the same heap.
            for i in 0 ..< THREAD_LOOPS {
                intrinsics.atomic_add(&shared_counter, 1)
                if i % 64 == 0 {
                    p := new(Enemy)
                    free(p)
                }
            }
            ctru.threadJoin(th, max(u64))
            ctru.threadFree(th)
        }
        count := intrinsics.atomic_load(&shared_counter)
        want_sum := i64(THREAD_LOOPS) * i64(THREAD_LOOPS - 1) / 2
        ok = ok && count == 2 * THREAD_LOOPS && worker_sum == want_sum && intrinsics.atomic_load(&worker_done) == 1
        report("thread+atomics", ok, "counter %d sum %d", count, worker_sum)
    }
}

@(export, link_name = "odin_main")
game_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    context = o3dx.init()
    o3dx.panic_action = .EXIT

    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
    c2d.C2D_Prepare()
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

    run_tests()
    passed := 0
    for r in results do passed += int(r.ok)
    log.infof("%d of %d tests passed", passed, len(results))

    WHITE  := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
    GREEN  := c2d.C2D_Color32(0x40, 0xE0, 0x40, 0xFF)
    RED    := c2d.C2D_Color32(0xFF, 0x40, 0x40, 0xFF)
    GREY   := c2d.C2D_Color32(0x90, 0x90, 0x90, 0xFF)
    YELLOW := c2d.C2D_Color32(0xFF, 0xDC, 0x00, 0xFF)
    BG     := c2d.C2D_Color32(0x10, 0x12, 0x20, 0xFF)

    // Text is re-parsed every frame from strings on the temp allocator.
    text_buf := c2d.C2D_TextBufNew(4096)
    draw :: proc(buf: c2d.C2D_TextBuf, x, y, scale: f32, color: u32, s: cstring) {
        t: c2d.C2D_Text
        c2d.C2D_TextParse(&t, buf, s)
        c2d.C2D_DrawTextColor(&t, c2d.C2D_AlignLeft | c2d.C2D_WithColor, x, y, 0, scale, scale, color)
    }

    frames: int
    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        k_down := ctru.hidKeysDown()
        if k_down & ctru.KEY_START != 0 do break
        if k_down & ctru.KEY_Y != 0 {
            assert(frames < 0, "Y was pressed: this assertion fails on purpose")
        }

        c2d.C2D_TextBufClear(text_buf)
        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c2d.C2D_TargetClear(top, BG)
        c2d.C2D_SceneBegin(top)

        draw(text_buf, 8, 4, 0.6, WHITE, "Runtime example (lib/o3dx)")
        y := f32(24)
        for r in results {
            // ctprintf allocates from context.temp_allocator, freed below each frame.
            status_color := RED
            if r.ok do status_color = GREEN
            draw(text_buf, 8, y, 0.45, status_color, pass_fail(r.ok))
            draw(text_buf, 44, y, 0.45, WHITE, fmt.ctprintf("%s", r.name))
            draw(text_buf, 150, y, 0.42, GREY, fmt.ctprintf("%s", r.detail))
            y += 15
        }
        total_color := RED
        if passed == len(results) do total_color = GREEN
        draw(text_buf, 8, y + 4, 0.55, total_color, fmt.ctprintf("%d of %d passed", passed, len(results)))
        draw(text_buf, 8, 222, 0.45, YELLOW, fmt.ctprintf("frame %d   Y: fail an assert   START: exit", frames))

        c3d.C3D_FrameEnd(0)

        free_all(context.temp_allocator)
        frames += 1
    }

    c2d.C2D_TextBufDelete(text_buf)
    c2d.C2D_Fini()
    c3d.C3D_Fini()
    ctru.gfxExit()
    o3dx.shutdown()
    return 0
}
