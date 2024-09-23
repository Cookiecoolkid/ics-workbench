#include "common.h"
#include <inttypes.h>

void mem_read(uintptr_t block_num, uint8_t *buf);
void mem_write(uintptr_t block_num, const uint8_t *buf);

static uint64_t cycle_cnt = 0;

typedef struct Cache{
  uint8_t dirtyBit;
  uint8_t valid;
  uint32_t tag;
  
  uint8_t data[BLOCK_SIZE];
}CacheLine;

CacheLine cacheLine[1 << 10];

static uint32_t totalLines;
static uint32_t blocksOfGroup;
static uint32_t groupNum;
static uint32_t groupNumWidth;

void cycle_increase(int n) { cycle_cnt += n; }

// TODO: implement the following functions

uint32_t cache_read(uintptr_t addr) {
  uint32_t memBlockAddr = addr / BLOCK_SIZE;
  uint32_t blockOffset = addr % BLOCK_SIZE;

  blockOffset = blockOffset - (blockOffset % 4);

  uint32_t groupIndex = memBlockAddr % groupNum;
  uint32_t tag = memBlockAddr / groupNum;
  
  // check in cache
  uint32_t cacheOffset = groupIndex * blocksOfGroup;
  for (int i = 0; i < blocksOfGroup; i++)
  {
	  uint32_t cacheIndex = cacheOffset + i;
	  if(cacheLine[cacheIndex].valid && tag == cacheLine[cacheIndex].tag)
	  {
		  // printf("Read Hit: cacheIndex = %d, tag = %d\n\n", cacheIndex, tag);
		  return *((uint32_t*)(cacheLine[cacheIndex].data + blockOffset));
	  }
  }
  // miss random replace
  uint32_t replaceIndex = cacheOffset + (rand() % blocksOfGroup);
  for (int i = 0; i < blocksOfGroup; i++)
  {
	  uint32_t cacheIndex = cacheOffset + i;
	  if(cacheLine[cacheIndex].valid == 0) 
	  {
		  replaceIndex = cacheIndex;
		  break;
	  }
  }
  // write back
  if (cacheLine[replaceIndex].valid && cacheLine[replaceIndex].dirtyBit)
  {
	  uint32_t writeBackAddr = (cacheLine[replaceIndex].tag << groupNumWidth) | groupIndex;
	  mem_write(writeBackAddr, cacheLine[replaceIndex].data);
  }
  cacheLine[replaceIndex].dirtyBit = 0;
  cacheLine[replaceIndex].valid = 1;
  cacheLine[replaceIndex].tag = tag;
  uint32_t readAddr = (tag << groupNumWidth) | groupIndex;
  mem_read(readAddr, cacheLine[replaceIndex].data);

  /// printf("Read Miss: ReadAddr = %d,ReplaceIndex = %d, tag = %d\n\n", readAddr, replaceIndex, tag);
  return *((uint32_t*)(cacheLine[replaceIndex].data + blockOffset));
}

void cache_write(uintptr_t addr, uint32_t data, uint32_t wmask) {
  uint32_t memBlockAddr = addr / BLOCK_SIZE;
  uint32_t blockOffset = addr % BLOCK_SIZE;

  blockOffset = blockOffset - (blockOffset % 4);

  uint32_t groupIndex = memBlockAddr % groupNum;
  uint32_t tag = memBlockAddr / groupNum;
  
  // check in cache
  uint32_t cacheOffset = groupIndex * blocksOfGroup;
  for (int i = 0; i < blocksOfGroup; i++)
  {
	  uint32_t cacheIndex = cacheOffset + i;
	  if(cacheLine[cacheIndex].valid && tag == cacheLine[cacheIndex].tag)
	  {
		  // printf("Write Hit: cacheIndex = %d, tag = %d\n\n", cacheIndex, tag);
		  cacheLine[cacheIndex].dirtyBit = 1;
		  uint32_t originData = *((uint32_t*)(cacheLine[cacheIndex].data + blockOffset));
		  *((uint32_t*)(cacheLine[cacheIndex].data + blockOffset)) = (data & wmask) | (originData & ~wmask);
		  return;
	  }
  }

  // miss random replace
  uint32_t replaceIndex = cacheOffset + (rand() % blocksOfGroup);
  for (int i = 0; i < blocksOfGroup; i++)
  {
	  uint32_t cacheIndex = cacheOffset + i;
	  if(cacheLine[cacheIndex].valid == 0) 
	  {
		  replaceIndex = cacheIndex;
		  break;
	  }
  }
  // write back
  if (cacheLine[replaceIndex].valid && cacheLine[replaceIndex].dirtyBit)
  {
	  uint32_t writeBackAddr = (cacheLine[replaceIndex].tag << groupNumWidth) | groupIndex;
	  mem_write(writeBackAddr, cacheLine[replaceIndex].data);
  }
  cacheLine[replaceIndex].dirtyBit = 1;
  cacheLine[replaceIndex].valid = 1;
  cacheLine[replaceIndex].tag = tag;
  uint32_t readAddr = (tag << groupNumWidth) | groupIndex;
  
  //printf("Write Miss: ReplaceIndex = %d, tag = %d\n\n", replaceIndex, tag);

  mem_read(readAddr, cacheLine[replaceIndex].data);

  uint32_t originData = *((uint32_t*)(cacheLine[replaceIndex].data + blockOffset));
  *((uint32_t*)(cacheLine[replaceIndex].data + blockOffset)) = (data & wmask) | (originData & ~wmask);
  return;
}

// 16kB size_width = (14b) associativity_width = 2, 4 blocks
 
void init_cache(int total_size_width, int associativity_width) {
  totalLines = (1 << total_size_width) / BLOCK_SIZE;
  blocksOfGroup = 1 << associativity_width;
  groupNum = totalLines / blocksOfGroup;
  groupNumWidth = total_size_width - BLOCK_WIDTH - associativity_width;

  assert(total_size_width - BLOCK_WIDTH <= 10);

  for(int i = 0; i < totalLines; i++)
  {
	  cacheLine[i].dirtyBit = 0;
	  cacheLine[i].valid = 0;
	  cacheLine[i].tag = 0;
	  for(int j = 0; j < BLOCK_SIZE; j++) cacheLine[i].data[j] = 0;
  }
}

void display_statistic(void) {
  for(int i = 0; i < totalLines; i++)
	  if(cacheLine[i].valid) 
		printf("cacheLine[%d]: dirtyBit = %d, valid = %d, tag = %d\n", 
	  		i, cacheLine[i].dirtyBit, cacheLine[i].valid, cacheLine[i].tag);
}
