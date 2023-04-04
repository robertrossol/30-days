#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'minimumBribes' function below.
#
# The function accepts INTEGER_ARRAY q as parameter.
#

def minimumBribes(q)
  t = Time.now
  bribes = 0
  (q.size-1).downto(0).each do |index|
    offset = (q[index] - (index + 1))
    if offset > 2
      puts "Too chaotic"
      return
    else
      x = ([q[index]-2, 0].max..index).select{|num| q[num] > q[index]}.count
      bribes += x
      # Alternative to the above two lines
      # ([q[index]-2, 0].max..index).each{|num| bribes += 1 if q[num] > q[index]}
    end
  end
  puts bribes
  puts Time.now - t
end

t = gets.strip.to_i

t.times do |t_itr|
    n = gets.strip.to_i

    q = gets.rstrip.split.map(&:to_i)

    minimumBribes q
end
