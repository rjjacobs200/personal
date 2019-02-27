
def test
  tree = BinarySearchTree.new
  for i in 0..100
    tree.add Random.rand 10000
  end
  tree.each {|i| puts i}
end

class BinaryTree
  class Node
    def initialize data, left = nil, right = nil
      @data, @left, @right = data, left, right
    end
    def each
      if @left  then @left.each  {|i| yield i} end
      yield @data
      if @right then @right.each {|i| yield i} end
    end
  end
  private_constant :Node
  def initialize
    @root = nil
  end
  def each
    @root.each {|i| yield i}
  end

end

class BinarySearchTree < BinaryTree
  class Node < BinaryTree::Node
    def add element
      case element <=> @data
      when 0
        return false
      when -1
        if !@left  then @left =  Node.new element
        else @left.add element  end
      when 1
        if !@right then @right = Node.new element
        else @right.add element end
      end
    end
  end
  def add element, node = @root
    if !@root then @root = Node.new element
    else @root.add element end
  end
end

test
