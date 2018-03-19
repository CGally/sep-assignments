require_relative 'node'

class Bacon

  attr_accessor :movies

	def initialize
    @movies = Array.new
	end

  def find_kevin_bacon(node_start, film_count = 0)
    node_start.film_actor_hash.each do |film, actors|
      film_count += 1

      actors.each do |actor|
        if actor.name == "Kevin Bacon"
          self.movies << film
          return self.movies
        end
      end
      if film_count == 6
        failure = "Can't find connection"
        return failure
      else
        self.movies << film
        return find_kevin_bacon(actors[0], film_count)
      end
    end
  end
end
