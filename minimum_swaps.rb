require 'json'
require 'stringio'

def minimumSwaps(arr)
  swaps = 0
  index = 0
  while index < arr.size 
    current_value = arr[index]
    desired_value = index + 1
    if current_value != desired_value
      arr[current_value - 1], arr[index] = arr[index], arr[current_value - 1]
      swaps += 1
    else
      index += 1
      next
    end
  end
  swaps
end

p minimumSwaps([4, 3, 1, 2]) # expected: 3
p minimumSwaps([2, 3, 4, 1, 5]) # expected: 3
p minimumSwaps([1, 3, 5, 2, 4, 6, 7]) # expected: 3
