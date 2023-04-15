# 6 r = 3
# 1 3 9 9 27 81

def countTriplets(arr, r)
  # arr = [1, 3, 9, 9, 27, 81]
  arr = arr.reverse
  triple = Hash.new(0)
  tuple = Hash.new(0)
  element = Hash.new(0)
  # arr = [81, 27, 9, 9, 3, 1]
  (0..arr.size - 1).each do |i|
    val = arr[i]
    triple[val] += tuple[val*r]
    # triple = {81: 0, 27: 0, 9: 2, 3: 2, 1: 2}
    tuple[val] += element[val*r] # if (val % r) == 0
    # tuple = {81: 0, 27: 1, 9: 2, 3: 2, 1: 0}
    element[val] += 1 if val % (r * r) == 0
    # element = {81: 1, 27: 1, 9: 2, 3: 0, 1: 0}
  end
  triple.values.reduce(&:+)
  # [0, 0, 2, 2, 2] = 6
end
