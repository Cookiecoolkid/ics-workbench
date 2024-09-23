#include "asm.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main() {
  asm_jmp_buf buf;
  char *dest = (char*)malloc(8);
  int r = asm_setjmp(buf);
  if (r == 0) {
    assert(asm_add(1234, 5678) == 6912);
    assert(asm_popcnt(0x0123456789abcdefULL) == 32);
	assert(strcmp((char*)asm_memcpy(dest, "hello", 4), "hell") == 0);
    // TODO: add more tests here.
    asm_longjmp(buf, 123);
  } else {
    assert(r == 123);
    printf("PASSED.\n");
  }
  return 0;
}
