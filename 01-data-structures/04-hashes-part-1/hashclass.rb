class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    item = HashItem.new(key, value)
    i = index(key, size)
    if @items[i] == nil
      @items[i] = item
      p @items.size
      p @items[i].key
      p @items[i].value
    elsif @items[i].key != key
      self.resize
      self[key] = value
      p @items.size
      p @items[i].key
      p @items[i].value
    elsif @items[i].key == key && @items[i].value != value
      self.resize
      @items[i] = item
      p @items.size
      p @items[i].key
      p @items[i].value
    end
  end


  def [](key)
    if @items[index(key, size)] != nil && @items[index(key, size)].key == key
      @items[index(key, size)].value
    end
  end

  def resize
    temp = @items
    @items = Array.new(@items.length * 2)
    temp.each do |item|
      if item != nil
        self[item.key] = item.value
      end
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

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end
end
