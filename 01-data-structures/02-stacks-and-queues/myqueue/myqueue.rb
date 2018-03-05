class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue = @queue + [element]
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    removed = @queue.delete(@head)
    @head = @queue[0]
    @tail = @queue[-1]
    removed
  end

  def empty?
    if @queue.length == 0
      true
    else
      false
    end
  end
end
