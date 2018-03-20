def i_binary_search(col, n)
  low = 0
  high = col.length - 1
  while low <= high
    mid = (low + high) / 2
    if col[mid] > n
      high = mid - 1
    elsif col[mid] < n
     low = mid + 1
    else
      puts col[mid]
      return mid
    end
  end
end
array = [0, 1, 2, 3, 6, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20]
puts i_binary_search(array, 17)
