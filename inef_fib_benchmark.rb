
BENCHMARKING_INDEX = ARGV[0].to_i

require 'benchmark'

def inefficient_fibonacci n
  case n
  when 0, 1
    n
  else
    (inefficient_fibonacci n - 1) + (inefficient_fibonacci n - 2)
  end
end

puts Benchmark.measure {inefficient_fibonacci BENCHMARKING_INDEX}
