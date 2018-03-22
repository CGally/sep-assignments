require_relative "quick"

def bucket_sort(array, number_of_buckets)
  buckets = []
  number_of_buckets.times do
    buckets << []
  end

  bucket_size = (array.length / number_of_buckets).ceil + 1
  array_count = 0
  bucket_count = 0

  buckets.each do
    bucket_size.times do
      buckets[bucket_count] << array[array_count]
      array_count += 1
      if array_count == array.length
        break
      end
    end
    bucket_count += 1
  end

  sorted_buckets = []
  buckets.each do |bucket|
    bucket = quick_sort(bucket)
    sorted_buckets << bucket
  end

  return quick_sort(sorted_buckets.flatten)
end

# arr = [0, 11, 26, 13, 6, 99, 10, 111, 12, 3, 51, 62, 17, 88, 2, 20]
# puts bucket_sort(arr, 3)
