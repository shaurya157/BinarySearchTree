class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    @root = BinarySearchTree.insert!(@root, value)
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) unless node

    if value <= node.value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value

    if value <= node.value
      BinarySearchTree.find!(node.left, value)
    else
      BinarySearchTree.find!(node.right, value)
    end
  end

  def self.preorder!(node)
    return [] unless node
    [node.value] + BinarySearchTree.preorder!(node.left) + BinarySearchTree.preorder!(node.right)
  end

  def self.inorder!(node)
    return [] unless node
    BinarySearchTree.inorder!(node.left) + [node.value] + BinarySearchTree.inorder!(node.right)
  end

  def self.postorder!(node)
    return [] unless node
    BinarySearchTree.postorder!(node.left) + BinarySearchTree.postorder!(node.right) + [node.value]
  end

  def self.height!(node)
    return -1 unless node.is_a?(BSTNode)

    left_height = 1 + BinarySearchTree.height!(node.left)
    right_heght = 1 + BinarySearchTree.height!(node.right)

    left_height > right_heght ? left_height : right_heght
  end

  def self.max(node)
    return nil unless node
    return node if node.right == nil

    BinarySearchTree.max(node.right)
  end

  def self.min(node)
    return nil unless node
    return node if node.left == nil

    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left

    node.left = BinarySearchTree.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node

    if value < node.value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif value > node.value
      node.right = BinarySearchTree.delete!(node.right, value)
    else
      return node.right unless node.left
      return node.left unless node.right

      temp_node = node
      node = temp_node.right.min
      node.right = BinarySearchTree.delete_min!(temp_node.right)
      node.left = temp_node.left
    end

    node
  end
end
