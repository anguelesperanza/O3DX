package poc_example

import "core:fmt"
import "core:mem"
import "core:strings"
import "core:bytes"
import "base:runtime"

foreign {
  printf :: proc(fmt: cstring, #c_vararg args: ..any) ---
}

fmt_printf :: proc(f: string, args: ..any) {
  printf("%s", fmt.caprintf(f, ..args, allocator = context.temp_allocator))
}

SampleType :: enum {
  Hellope
}

@(export, link_name="odin_main")
odin_main :: proc "c" () {
  buf: [4096]byte

  context = runtime.default_context()
  small_stack := mem.Small_Stack{}
  mem.small_stack_init(&small_stack, buf[:])
  context.temp_allocator = mem.small_stack_allocator(&small_stack)

  program := "+ + * 😃 - /"
  accumulator := 0

  for token in program {
    switch token {
    case '+': accumulator += 1
    case '-': accumulator -= 1
    case '*': accumulator *= 2
    case '/': accumulator /= 2
    case '😃': accumulator *= accumulator
    case: // Ignore everything else
    }
  }

  sb: strings.Builder
  strings.builder_init_len_cap(&sb, 0, 128, context.temp_allocator)

  for token in program {
    if token < 0x80 {
      fmt.sbprint(&sb, token)
    } else {
      fmt.sbprint(&sb, '?')
    }
  }

  fmt_printf("'%v' = %v\n%v\n%v\n", strings.to_string(sb), accumulator, typeid_of([]byte), SampleType.Hellope)
}
