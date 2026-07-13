class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end

  def insert(new_value)
    if new_value < @value
      @left.nil? ? @left = Node.new(new_value) : @left.insert(new_value)
    else
      @right.nil? ? @right = Node.new(new_value) : @right.insert(new_value)
    end
  end
end

def sum_of_tree(node)
  if node == nil
    return 0
  end

  return node.value + sum_of_tree(node.right) + sum_of_tree(node.left)
end