require "benchmark"
require_relative 'fibonnaci_iterative'
require_relative 'fibonnaci_recursive'


Benchmark.bmbm do |x|
  x.report("Iterative: ") { fib_i(20) }
  x.report("Recursive: ") { fib_r(20) }
end
