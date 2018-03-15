require "benchmark"
require_relative 'node'
require_relative 'binary_search_tree'
require_relative 'min_binary_heap'

array = []
count = 2
49999.times do
  array << Node.new(count, rand(100))
  count += 1
end
fifty_thousand = Node.new(count, rand(100))
array << fifty_thousand
count += 1
50000.times do
  array << Node.new(count, rand(100))
  count += 1
end

root = Node.new(1, rand(100))
bin_tree = BinarySearchTree.new(root)
heap = MinBinaryHeap.new(root)
bin_tree2 = BinarySearchTree.new(root)
heap2 = MinBinaryHeap.new(root)

array.each do |item|
  heap.insert(item)
end
array.each do |item|
  heap.insert(item)
end

Benchmark.bmbm do |x|
  x.report("Insert Binary Search Tree: ") {
    array.each do |item|
      bin_tree2.insert(root, item)
    end
  }
  x.report("Insert Heap: ") {
    array.each do |item|
      heap2.insert(item)
    end
  }
  x.report("Find 50000th Binary Search Tree: ") {
    bin_tree.find(root, fifty_thousand)
  }
  x.report("Find 50000th Heap: ") {
    heap.find(50000)
  }
  x.report("Delete 50000th Binary Search Tree: ") {
    bin_tree.delete(root, 50000)
  }
  x.report("Delete 50000th Heap: ") {
    heap.delete(50000)
  }
end
