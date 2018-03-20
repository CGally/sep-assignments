require_relative 'node'
require_relative 'film'

class Bacon
  attr_accessor :actors

  def find_kevin_bacon(start_node)
    result = search_for_kevin(start_node)
    array = []
    if result == false
      return "Kevin Bacon is more than six degrees away"
    elsif result.length == 0
      return "Can't find connection"
    else
      result.each do |film|
        array << film.title
      end
      return array
    end
  end

  def search_for_kevin(node)
    failure = false
    films = []
    node.film_actor_hash.each do |film, actors|
      if film.kevin == true
          films << film
          break
      end
      actors.each do |actor|
        if !actor.visited
          actor.visited = true
          current = search_for_kevin(actor)
          if !current
            return failure
          end
          if current.length != 0
            films << film
            films += current
          end
        end
      end
    end
    if films.uniq.length >= 6
      return failure
    end
      return films.uniq
  end

end
