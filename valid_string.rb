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
    # Write your code here
    char_count = s.chars.each.with_object(Hash.new(0)) {|char, hsh| hsh[char] += 1}
    lengths = char_count.values.uniq
    # if (lengths.size > 2 || char_count.values.count(lengths.max) != 1)
    return "NO" unless (lengths.size <= 2 && (lengths.max-lengths.min <= 1) && (char_count.values.count(lengths.max) == 1 || char_count.values.count(lengths.min) == 1 ))
    return "YES"
end


