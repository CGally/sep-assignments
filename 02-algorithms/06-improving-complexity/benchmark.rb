require "benchmark"
require_relative 'original'
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'
require_relative 'improving_complexity_version_three'

array = Array.new(5000) { rand 1000 }
array_2 = Array.new(5000) { rand 1000 }

Benchmark.bmbm do |x|
  x.report("Original: ") { poorly_written_ruby(array, array_2) }
  x.report("Optimized: ") { optimized(array, array_2) }
  x.report("Time: ") { time(array, array_2) }
  x.report("Space: ") { space(array, array_2) }
end
