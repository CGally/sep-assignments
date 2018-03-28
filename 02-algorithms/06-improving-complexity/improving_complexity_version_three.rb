# def space(*arrays)
#   arrays.flatten.sort
# end

def space(*arrays)
  combined_array = arrays.flatten
  n = combined_array.length

  begin
    swapped = false
    (n - 1).times do |i|
      if combined_array[i] > combined_array[i + 1]
        tmp = combined_array[i]
        combined_array[i] = combined_array[i + 1]
        combined_array[i + 1] = tmp
        swapped = true
      end
    end
  end until not swapped

  combined_array
end
