def bubble_sort array
  '''
  array: unsorted array
  return: sorted array
  '''
  print "#{array}\n"
  swap_count = 1
  max_iter = array.length-1

  while swap_count > 0
    swap_count = 0
    for i in 0...max_iter
        if array[i] > array[i+1]
          array[i], array[i+1] = array[i+1], array[i]
          swap_count += 1
        end
    end
    max_iter -= 1
  end
  print "#{array}\n"
end

bubble_sort [1,2,6,1,2,0,32,5]


def bubble_sort_by(array)
  print "#{array}\n"
  swap_count = 1
  max_iter = array.length-1
  while swap_count > 0
    swap_count = 0
    for i in 0...max_iter
      if yield(array[i],array[i+1]) > 0
        array[i], array[i+1] = array[i+1], array[i]
        swap_count += 1
      end
    end
    max_iter -= 1
  end
  print "#{array}\n"
end



bubble_sort_by (["hi", "hello", "hey"]) do |left,right|
  left.length - right.length
end