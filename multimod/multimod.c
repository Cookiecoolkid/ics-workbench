#include <stdint.h>

static inline uint64_t  bit_of(uint64_t x, uint64_t i)
{
	return (x >> i) & 1;
}
uint64_t MOD(uint64_t a, uint64_t m)
{
    uint64_t tmp = m;
    while (a >= m)
    {
       while (tmp < a && tmp < (uint64_t)1 << 63) tmp <<= 1;
       while (tmp > a && tmp > m) tmp >>= 1;
       a -= tmp;
    }
    return a;
} 
uint64_t overflow_mod(uint64_t a, uint64_t b, uint64_t m) // (a + b) % m
{
     uint64_t max64 = -1;
     max64 = MOD(max64, m) + 1; // 2^64 % m
     if (max64 == m) max64 = 0;
	 uint64_t t = a + b;
     uint64_t OF1 = MOD(a + b, m), OF2 = max64;
     uint64_t ret = OF1;
	 int OF = 0;
	 if (t < a || t < b) // overflow
		{
		   ret += OF2;
		   OF = 1;
		}
     while (OF && (ret < OF1 || ret < OF2)) // overflow
     {
        OF1 = MOD(ret, m);
        ret = OF1 + OF2;
     }
     ret = MOD(ret, m);
     return ret;
}
uint64_t multimod(uint64_t a, uint64_t b, uint64_t m)
{
  // return (a * b) % m; // buggy
   uint64_t ret = 0;
   for (int i = 63; i >= 0; i--)
   {
       uint64_t tmp = b;
       if (bit_of(a, i))
       {
           for (int j = 0; j < i; j++)
               tmp = overflow_mod(tmp, tmp, m); // equal to b << i
           ret = overflow_mod(ret, tmp, m);
       }
   }
   ret = MOD(ret, m);
   return ret;
}
