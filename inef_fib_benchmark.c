
#include <time.h>
#include <stdio.h>

#define BENCHMARKING_INDEX 40

unsigned long inefficient_fibonacci(unsigned int index) {
  if (index == 0 || index == 1) return index;
  return inefficient_fibonacci(index - 1) + inefficient_fibonacci(index - 2);
}

int main() {
  //printf("Beginning benchmark...");
  //time_t start_time = time(NULL);
  unsigned long calculated_value = inefficient_fibonacci(BENCHMARKING_INDEX);
  //printf("fib(%i) = %lu (%f seconds elapsed)\n",
    //BENCHMARKING_INDEX, calculated_value, difftime(time(NULL), start_time));
  return 0;
}
