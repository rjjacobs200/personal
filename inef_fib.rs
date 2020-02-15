
const BENCHMARKING_INDEX: u64 = 45;

use std::io;

fn inef_fib(n: u64) -> u64 {
    if n <= 1 {return n};
    inef_fib(n - 1) + inef_fib(n - 2)
}

fn main() {
    println!("fib({}): {}", BENCHMARKING_INDEX, inef_fib(BENCHMARKING_INDEX));
}
