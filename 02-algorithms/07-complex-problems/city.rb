class City
  attr_accessor :name, :visited, :neighbors

  def initialize(name)
    @name = name
    @visited = false
    @neighbors = Hash.new()
  end
end
