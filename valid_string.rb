#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'isValid' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def isValid(s)
  char_count = s.chars.each.with_object(Hash.new(0)) {|char, hsh| hsh[char] += 1}

  lengths = char_count.values.uniq
  lengths_count = lengths.map { |len| [len, char_count.values.count(len)]}.to_h
  # alternative way to create the lengths_count hash:
  # char_count.values.group_by(&:itself).to_h.transform_values(&:length)

  lengths.size == 1 || 
    lengths.size == 2 && 
      (lengths_count[1] == 1 || lengths_count[lengths.max  ] == 1 && lengths.max - lengths.min == 1) ? "YES" : "NO"
  # instead of lengths.max - lengths.min == 1, use the absolute value of reduce(&:-) on the keys of lengths_count
  # lengths_count.keys.reduce(&:-).abs
end
