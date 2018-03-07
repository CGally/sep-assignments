require "benchmark"
require_relative 'node'
require_relative 'linked_list'

arr = (1..10000).map { rand 1000 }
list_a = LinkedList.new
list_b = LinkedList.new

10000.times do
  list_b.add_to_tail(Node.new(rand(1000)))
end

Benchmark.bmbm do |x|
  x.report("Create Array: ") { (1..10_000).to_a }
  x.report("Create List: ") { 10000.times do; list_a.add_to_tail(Node.new(rand(1000))); end }
  x.report("Find 5000th item Array: ") { arr.fetch(5000) }
  x.report("Find 5000th Node List: ") { list_b.find_node(5000) }
  x.report("Delete 5000th item Array: ") { arr.delete_at(5000) }
  x.report("Delete 5000th Node List: ") { list_b.remove_node(5000) }
end
