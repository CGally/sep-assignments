require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating < root.rating
      if !root.left
        root.left = node
      else
        insert(root.left, node)
      end
    elsif node.rating > root.rating
      if !root.right
        root.right = node
      else
        insert(root.right, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if !data
      nil
    elsif root.title == data
      root
    elsif !root.right && !root.left
      nil
    elsif !root.right
      if root.left == data
        root.left
      else
        find(root.left, data)
      end
    elsif !root.left
      if root.right == data
        root.right
      else
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    current = self.find(root, data)
    if current == nil
      nil
    else
      current.title = nil
      current.rating = nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    array = [@root]
    count = 0
    while array[count]
      if array[count].left
        array.push(array[count].left)
      end
      if array[count].right
        array.push(array[count].right)
      end
      count += 1
    end
    array.each do |item|
      puts "#{item.title}: #{item.rating}\n"
    end
  end
end
