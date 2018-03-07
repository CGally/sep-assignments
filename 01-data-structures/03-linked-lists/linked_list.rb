require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @tail == nil
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail
      @tail = nil
      @head = nil
    else
      current = @head
      while current.next != @tail
        current = current.next
      end
      current.next = nil
      @tail = current
    end
  end

  # This method prints out a representation of the list.
  def print
    current = @head
    while current != nil
      puts current.data
      current = current.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @tail
      self.remove_tail
    elsif node == @head
      self.remove_front
    else
      current = @head
      while current.next != node
        current = current.next
      end
      current.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == @tail
      @tail = nil
      @head = nil
      return
    else
      @head = @head.next
    end
  end

  #created to find 5000th item for benchmark test
  def find_node(position)
    count = 1
    current = @head
    while count < position
      current = current.next
      count = count + 1
    end
    current
  end

  #created to delete 5000th item for benchmark test
  def remove_node(position)
    count = 1
    current = @head
    while count < position - 1
      current = current.next
      count = count + 1
    end
    current.next = current.next.next
  end
end
