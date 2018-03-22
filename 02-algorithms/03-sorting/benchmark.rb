require "benchmark"
require_relative 'insertion'
require_relative 'selection'
require_relative 'bubble'
require_relative 'merge'
require_relative 'quick'
require_relative 'heap'
require_relative 'bucket'

array = Array.new(10000) { rand 1000 }

Benchmark.bmbm do |x|
  x.report("Insertion Sort: ") { insertion_sort(array) }
  x.report("Selection Sort: ") { selection_sort(array) }
  x.report("Bubble Sort: ") { bubble_sort(array) }
  x.report("Merge Sort: ") { merge_sort(array) }
  x.report("Quick Sort: ") { quick_sort(array) }
  x.report("Heap Sort: ") { heap_sort(array) }
  x.report("Bucket Sort: ") { bucket_sort(array, 200) }
end
