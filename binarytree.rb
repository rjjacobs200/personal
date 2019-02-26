class BinaryeTree
  class Node
    attr_accessor :data, :left, :right
    def initialize data, left = nil, right = nil
      @data, @left, @right = data, left, right
    end
  end
  def initialize
    @root = nil
  end
  def each func = lambda {|i| yield i}, node = root
    if node.left  then each func, node.left  end
    if node.right then each func, node.right end
  end
end

class BinarySearchTree < BinaryeTree
  def add element, node = root
    case element <=> node.data
    when 0
      return false
    when -1
      if !node.left  then node.left = node.new element
      else add element, node.left end
    when 1
      if !node.right then node.right = node.new element
      else add element, node.right end
    end
  end
end
