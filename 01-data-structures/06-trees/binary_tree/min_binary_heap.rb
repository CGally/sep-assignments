require_relative 'node'

class MinBinaryHeap
  attr_accessor :heap

  def initialize(root)
    @heap = [root]
  end

  def insert(data)
    @heap << data
    swap(@heap.length - 1)
    # @heap.each_with_index do |item, index|
    #   if  @heap[index * 2 + 1]
    #     item.left = @heap[index * 2 + 1]
    #   end
    #   if  @heap[index * 2 + 2]
    #     item.right = @heap[index * 2 + 2]
    #   end
    # end
  end

  def swap(index)
    if index == 0
      return
    end
    if @heap[index].rating < @heap[((index - 1) / 2)].rating
      temp = @heap[index]
      @heap[index] = @heap[((index - 1) / 2)]
      @heap[((index - 1) / 2)] = temp
      swap(((index - 1) / 2))
    end
  end

  def find(data)
    @heap.each do |item|
      if item && item.title == data
        return item
      end
    end
    nil
  end

  def delete(data)
    @heap.each_with_index do |item, index|
      if item && item.title == data
        @heap.delete_at(index)
      end
    end
    swap(@heap.length - 1)
  end

  def print
    @heap.each do |item|
      if item
        puts "#{item.title}: #{item.rating}\n"
      end
    end
  end
end
