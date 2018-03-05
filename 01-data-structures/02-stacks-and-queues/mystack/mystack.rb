class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    self.top = item
    @stack = @stack + [item]
  end

  def pop
    removed = @stack.delete(self.top)
    self.top = @stack.last
    removed
  end

  def empty?
    if @stack.length == 0
      true
    else
      false
    end
  end
end
