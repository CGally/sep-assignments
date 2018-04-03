require_relative 'city.rb'

class TravelingSalesman
  attr_accessor :path

  def initialize
    @path = []
  end

  def nearest_neighbor(current_city)
    neighbors = current_city.neighbors
    next_city = current_city
    shortest = nil

    neighbors.each do |city, distance|
      if !city.visited
        if shortest == nil
          shortest = distance
        end

        if distance <= shortest
          shortest = distance
          next_city = city
        end
      end
    end

    current_city.visited = true
    next_city
  end

  def travel(start_city)
    if start_city.visited == true
      return path
    else
      path << start_city.name
      next_city = nearest_neighbor(start_city)
      travel(next_city)
    end
  end
end
