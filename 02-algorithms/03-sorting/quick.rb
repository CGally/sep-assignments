def quick_sort(array)
  if array.length <= 1
    return array
  end

  pivot = array[-1]
  array.delete(pivot)

  first = Array.new
  second = Array.new

  array.each do |item|
    if item <= pivot
      first << item
    else
      second << item
    end
  end
  return quick_sort(first) + [pivot] + quick_sort(second)
end



# arr = [0, 11, 26, 13, 6, 99, 10, 111, 12, 3, 51, 62, 17, 88, 2, 20]
# puts quick_sort(arr)
