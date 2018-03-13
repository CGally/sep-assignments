require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    item = Node.new(key, value)
    i = index(key, size)
    if @items[i] == nil
      @items[i] = item
    elsif @items[i].key != key
      self.resize
      self[key] = value
    elsif @items[i].key == key && @items[i].value != value
      if self.next_open_index(i) == -1
        self.resize
        @items[i] = item
      else
        @items[i] = item
      end
    end
  end

  def [](key)
    if @items[index(key, size)] != nil && @items[index(key, size)].key == key
      @items[index(key, size)].value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    hash_code = 0
    key.each_byte do |c|
      hash_code = hash_code + c
    end
    hash_code % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while index < @items.length - 1
      if @items[index] == nil
        return index
      else
        index += 1
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp = @items
    @items = Array.new(@items.length * 2)
    temp.each do |item|
      if item != nil
        self[item.key] = item.value
      end
    end
  end
end
