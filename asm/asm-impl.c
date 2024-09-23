#include "asm.h"

int64_t asm_add(int64_t a, int64_t b){ 
   asm volatile(
	"addq %%rbx, %%rax\n\t"
	:[c] "+a"(a)
	:"b"(b)
  ); 
  return a;
}

int asm_popcnt(uint64_t x) {	
  int s = 0;
  asm volatile(
    "st: \n\t"
	"shr %1 \n\t"
	"adc $0x0, %0\n\t"
	"test %1, %1 \n\t"
	"jnz st \n\t"
	:"+r"(s)
	:"r"(x) 
  );
  return s;
}

void *asm_memcpy(void *dest, const void *src, size_t n) {
/*
  int d0, d1, d2;
  asm volatile(
	"start: \n\t"
	"lodsb  \n\t"
	"stosb  \n\t"
	"sub $1, %[n] \n\t"
	"cmp $0, %[n] \n\t"
	"je end \n\t"
	"testb %%al, %%al \n\t"
	"jne start \n\t"
	"end: \n\t"
	:"=&S"(d0), "=&D"(d1), "=&a"(d2)
	:"0"(src), "1"(dest), [n]"r"(n)
	:"memory"
  );
  */
  asm volatile(
	"movq %0, %%rdi \n\t"
	"movq %1, %%rsi \n\t"
	"movq %2, %%rcx \n\t"
	"rep movsb \n\t"
	:
	:"r"(dest), "r"(src), "r"(n)
  );
  return dest;
  
  // return memcpy(dest, src, n);
}

int asm_setjmp(asm_jmp_buf env) {
  asm volatile(
	"movq %%rbx, 0x0(%%rdi) \n\t"
	"movq %%rbp, 0x8(%%rdi) \n\t"
	"movq %%r12, 0x10(%%rdi) \n\t"
	"movq %%r13, 0x18(%%rdi) \n\t"
	"movq %%r14, 0x20(%%rdi) \n\t"
	"movq %%r15, 0x28(%%rdi) \n\t"
	"movq (%%rsp), %%rax \n\t"
	"movq %%rax, 0x30(%%rdi) \n\t"
	"movq %%rsp, 0x38(%%rdi) \n\t"
	"addq $0x8, 0x38(%%rdi) \n\t"
//	//"movq (%%rsp), %%rdx \n\t"
//	//"movq %%rdx, 0x38(%%rdi) \n\t"
//	"pop  %%rbp\n\t"
//	//"movq %%rbp, 0x8(%%rdi) \n\t"
//	"movq %%rsp, 0x38(%%rdi) \n\t"
//	//"addq $0x8, 0x38(%%rdi) \n\t"
//	"movq 0x8(%%rdi), %%rbp \n\t"
//	"push %%rbp \n\t"
//	//"movq %%rsp, %%rbp \n\t"
	:
	//:[env]"D"(env)
	// :"rax", "rdx"
  );
  return 0;
}

void asm_longjmp(asm_jmp_buf env, int val) {
  asm volatile(
	"movq 0x0(%%rdi), %%rbx \n\t"
	"movq 0x8(%%rdi), %%rbp \n\t"
	"movq 0x10(%%rdi), %%r12 \n\t"
	"movq 0x18(%%rdi), %%r13 \n\t"
	"movq 0x20(%%rdi), %%r14 \n\t"
	"movq 0x28(%%rdi), %%r15 \n\t"
	"movq 0x30(%%rdi), %%rcx \n\t"
	"movq 0x38(%%rdi), %%rsp\n\t"
	"movl %%esi, %%eax \n\t"
	"jmpq *%%rcx \n\t"
	:
	//:[val]"r"(val), [env]"r"(env)
	//:"memory", "rbx", "r12", "r13", "r14", "r15", "rcx", "rdx", "eax"
  );
}
