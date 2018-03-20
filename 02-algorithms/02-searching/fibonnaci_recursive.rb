def fib_r(n)
  if (n == 0)
    # #1
    return 0
  elsif (n == 1)
    # #2
    return 1
  else
    # #3
    return fib_r(n-1) + fib_r(n-2)
  end
end
