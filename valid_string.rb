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
    duplicates = char_count.values.select {|val| val > 1}
    if duplicates.any?{|val| val > 2} || duplicates.size > 1
        "NO"
    else
        "YES"
    end
    # char_count.any? {|val| val > 2} || char_count.select
    # char_count.values.select {|val| val > 1}.reduce(&:+) > 2 ? "NO" : "YES"
end

