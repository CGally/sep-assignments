require_relative 'node'

class Bacon

  attr_accessor :movies

  def initialize
    @movies = Array.new
  end

  def find_kevin_bacon(node_start)
    actors = []
    actors.push(node_start)
    film_count = 0
    while actors.length != 0
      if film_count == 6
        failure = "Can't find connection"
        return failure
      end

      current = actors.shift
      current.film_actor_hash.each do |film, other_actors|
        if !self.movies.include?(film)
          self.movies.push(film)
          film_count += 1
        end
        other_actors.each do |actor|
          if !actors.include?(actor)
            if actor.name != "Kevin Bacon"
              actors.push(actor)
            end
          end
          if actor.name == "Kevin Bacon"
            return self.movies
          end
        end
      end
    end
    return "Can't find connection"
  end
end
