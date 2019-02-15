
#define BENCHMARKING_INDEX 45

#include <stdio.h>

unsigned inef_fib(unsigned n) {
    if (n <= 1) return n;
    return inef_fib(n - 1) + inef_fib(n - 2);
}

int main() {
    printf("fib(%u): %u\n", BENCHMARKING_INDEX, inef_fib(BENCHMARKING_INDEX));
}
