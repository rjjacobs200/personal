
BENCHMARKING_INDEX = 40

require 'benchmark'

def inefficient_fibonacci index
  case index
  when 0, 1
    index
  else
    (inefficient_fibonacci index - 1) + (inefficient_fibonacci index - 2)
  end
end

puts Benchmark.measure {inefficient_fibonacci BENCHMARKING_INDEX}
