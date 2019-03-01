STRUCTURE_SIZE  = ARGV[0].to_i
MAXIMUM_ELEMENT = STRUCTURE_SIZE * 100

require_relative 'DataStructures.rb'
require 'benchmark'

bst = BinarySearchTree.new
puts "For BinarySearchTree of size: #{STRUCTURE_SIZE}"
Benchmark.bm(7) do |x|
  x.report("add:") {(0..STRUCTURE_SIZE).each {bst.add(Random.rand MAXIMUM_ELEMENT)}}
end
puts bst.root_balance_factor
