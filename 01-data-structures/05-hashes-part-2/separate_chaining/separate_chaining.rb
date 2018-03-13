require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    item = Node.new(key,value)
    i = index(key,size)
    if @items[i] == nil
      @items[i] = LinkedList.new
      @items[i].add_to_tail(item)
    else
      @items[i].add_to_tail(item)
    end
      if load_factor > @max_load_factor
        self.resize
      end
   end


  def [](key)
    i = index(key,size)
    current = @items[i].head
    if current.key === key
      current.value
    else
      while current.key != key
        current = current.next
      end
      current.value
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

  # Calculate the current load factor
  def load_factor
    count = 0.0
    @items.each do |item|
      if item
        count += 1
        current = item.head
        while current.next
          count += 1
          current = current.next
        end
      end
    end
    count/@items.size
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
      if item
        current = item.head
        while current
          i = index(current.key, size)
          if @items[i] == nil
            @items[i] = LinkedList.new
          end
          @items[i].add_to_tail(current)
          current = current.next
        end
      end
    end
  end

  def print_state
    puts "Load factor: #{load_factor}"
    puts "{"
    @items.each_with_index do |item, index|
      if item != nil
        current = item.head
        while current != nil
          puts "Bucket: #{index}\t#{current.key}:  #{current.value},"
          current = current.next
        end
      end
    end
    puts "}"
  end
end
