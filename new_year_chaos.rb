#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'minimumBribes' function below.
#
# The function accepts INTEGER_ARRAY q as parameter.
#

def minimumBribes(q)
  offsets = q.map.with_index do |int, idx|
    int - (idx + 1)
  end
  bribes = 0
  if offsets.max > 2
    puts "Too chaotic"
    return
  end
  count = 0
  until offsets.all?(0)
    count +=1
    return if count > 10
    p offsets
    min = offsets.min 
    index_of_min = offsets.index(min)
    new_pos = index_of_min + min
    offsets[new_pos...index_of_min] = offsets[new_pos...index_of_min].map{|num| num -1}
    offsets.delete_at(index_of_min)
    offsets.insert((new_pos),0)
    bribes += min.abs
    p offsets
  # offsets[index_of_min + min..index_of_min]
  end
  puts bribes
  return
end



t = gets.strip.to_i

t.times do |t_itr|
    n = gets.strip.to_i

    q = gets.rstrip.split.map(&:to_i)

    minimumBribes q
end