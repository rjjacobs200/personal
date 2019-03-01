class Tree
  class Node
    def initialize data, *children
      @data, @children = data, children
    end
  end
  def initialize
    @root = nil
  end
end

class BinaryTree
  class Node < Tree::Node
    def initialize data, left = nil, right = nil
      @data, @left, @right = data, left, right
      data
    end
    def each
      if @left  then @left.each  {|i| yield i} end
      yield @data
      if @right then @right.each {|i| yield i} end
    end
    def height
      [if @left  then @left.height  + 1 else 0 end,
       if @right then @right.height + 1 else 0 end].max
    end
    def balance_factor
      @right.height - @left.height
    end
  end
  def initialize
    @root, @size = nil, 0
  end
  def each
    @root.each {|i| yield i}
  end
  alias iterate each
  def height
    @root.height
  end
end

class BinarySearchTree < BinaryTree
  class Node < BinaryTree::Node
    def add element
      case element <=> @data
      when 0
        nil
      when -1
        if !@left  then @left =  Node.new element
        else @left.add element  end
        element
      when 1
        if !@right then @right = Node.new element
        else @right.add element end
        element
      end
    end
  end
  def add element, node = @root
    @size += 1
    if !@root then @root = Node.new element; element
    else @root.add element end
  end
end
