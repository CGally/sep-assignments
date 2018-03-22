def heap_sort(array)
  max = array[0]
  array.each_with_index do |item, index|
    if item > array[max]
      max = index
    end
  end
  temp = array[0]
  array[0] = array[max]
  array[max] = temp

  (array.length-1).downto(1) do |node|
    temp = array[0]
    array[0] = array[node]
    array[node] = temp
    heapify(array, node, 0)
  end
  array
end

def heapify(array, node, root)
  max = root
  left = root * 2 + 1
  right = root * 2 + 2

  if left < node && array[max] < array[left]
    max = left
  end

  if right < node && array[max] < array[right]
    max = right
  end

  if max != root
    temp = array[max]
    array[max] = array[root]
    array[root] = temp
    heapify(array, node, max)
  end
end


# arr = [0, 11, 26, 13, 6, 99, 10, 111, 12, 3, 51, 62, 17, 88, 2, 20]
# puts heap_sort(arr)
