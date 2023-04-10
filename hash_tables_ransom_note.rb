#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'checkMagazine' function below.
#
# The function accepts following parameters:
#  1. STRING_ARRAY magazine
#  2. STRING_ARRAY note
#

def checkMagazine(magazine, note)
    a = [magazine, note].map do |arr|
       arr.each.with_object(Hash.new(0)) {|word, hash| hash[word] += 1 } 
    end

    magazines, notes = a[0], a[1]
    
    notes.each do |word, count|
        if magazines[word] < count
            puts "No"
            return 0
        end
    end
    puts "Yes"
end


first_multiple_input = gets.rstrip.split

m = first_multiple_input[0].to_i

n = first_multiple_input[1].to_i

magazine = gets.rstrip.split

note = gets.rstrip.split

checkMagazine magazine, note
