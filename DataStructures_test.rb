DEFAULT_STRUCTURE_SIZE = 10_000

STRUCTURE_SIZE  = if ARGV[0] then ARGV[0].to_i else DEFAULT_STRUCTURE_SIZE end
MAX_ELEMENT = STRUCTURE_SIZE * 100

require_relative 'DataStructures.rb'
require 'benchmark'

bst = BinarySearchTree.new
h = 0
puts "For BinarySearchTree of size: #{STRUCTURE_SIZE}"
Benchmark.bm(13) do |x|
  x.report("add:") {(0..STRUCTURE_SIZE).each {puts bst.add(Random.rand MAX_ELEMENT)}}
  x.report("height") {h = bst.height}
  x.report("traversal: ")  {bst.each{}}
end
puts "Height: #{h}"
