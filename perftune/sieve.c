#include <stdbool.h>
#include <string.h>
#include <assert.h>
#include <stdio.h>
#define N 10000000
bool is_prime[N];
int  primes[N / 4];

int *sieve(int n) {
  assert(n + 1 < N);
  for(int i = 6; i <= n; i += 6) is_prime[i - 1] = true, is_prime[i + 1] = true;
  is_prime[2] = true;
  is_prime[3] = true;
  // O(n) Sieve
  int index = 0;
  primes[++index] = 2;
  primes[++index] = 3;
  for (int i = 6; i <= n; i += 6) {
	int k = i - 1;
    if (is_prime[k]) primes[++index] = k;
	for(int j = 1; j <= index && k * primes[j] <= n; j++)
	{
		is_prime[k * primes[j]] = false;
		if(k % primes[j] == 0) break;
	}
	k = i + 1;
	if (is_prime[k]) primes[++index] = k;
	for(int j = 1; j <= index && k * primes[j] <= n; j++)
	{
		is_prime[k * primes[j]] = false;
		if (k % primes[j] == 0) break;
	}
  }
  	  
  int *p = primes;
  *p++ = 2;
  *p++ = 3;
  for (int i = 6; i <= n; i += 6)
  {
	  if (is_prime[i - 1]) 
       *p++ = i - 1;
	  if (is_prime[i + 1])
	   *p++ = i + 1;
  }
  *p = 0;

  return primes;
}
