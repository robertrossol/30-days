#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'twoStrings' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. STRING s1
#  2. STRING s2
#

def twoStrings(s1, s2)
  s1, s2 = s2, s1 if s1.size > s2.size # ensure that we're checking the longer string for each character in the shorter string, and not vice versa
  s1.chars.any? {|char| s2.include?(char) } ? "YES" : "NO"
end

x = Time.now
p twoStrings("apple", "aardvark")
p twoStrings("sandals", "beetroot")
p twoStrings("knvfjnoeinoewneowinoeincoeifowemwpekdmekofmoineroinfoernrgntuantiunfoerinfoeinknvfjnoeinoewneowinoeincoeifowemwpekdmekofmoineroinfoernrgntuntiunfoerinfoeinknvfjnoeinoewneowinoeincoeifowemwpekdmekofmoineroinfoernrgntuntiunfoerinfoein", "a")
puts Time.now - x

# Alternate One-liners
# (s1.split('') & s2.split('')).size.zero? ? 'NO' : 'YES'
# if (s1.chars & s2.chars).empty? then return 'NO' else return 'YES' end
# principle: using & with two arrays returns common elements
