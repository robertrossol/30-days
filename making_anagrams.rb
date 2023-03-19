require 'json'
require 'stringio'

#
# Complete the 'makeAnagram' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. STRING a
#  2. STRING b
#

def makeAnagram(a, b)
    # creates a hash of letters and their frequency from a string
    def letter_count_hash(str)
      str.split('').each.with_object(Hash.new(0)) do |el, hash|
        hash[el] += 1
      end
    end

    a, b = letter_count_hash(a), letter_count_hash(b)
    p a + b
    deletions = 0

    (a.keys + b.keys).uniq.each do |char|
      if a[char] != b[char]
        deletions += (a[char] - b[char]).abs
      end
    end

    deletions
end

# Good, simple alternates:

#1

# def makeAnagram(a, b)
#   anagrams_hash = Hash.new(0)
  
#   a.each_char { |c| anagrams_hash[c] += 1 }
#   # decrement the letters of b in hash
#   b.each_char { |c| anagrams_hash[c] -= 1}
  
#   # take the abs of each values and add them together, the abs value is all the different letters in both words
#   anagrams_hash.values.map {|v| v.abs}.sum
# end

#2

# def make_anagrams(a, b)
#   freq = Array.new(26, 0)
#   a.chars.each { |c| freq[c.ord - 'a'.ord] += 1 }
#   b.chars.each { |c| freq[c.ord - 'a'.ord] -= 1 }
#   freq.map(&:abs).sum
# end

puts make_anagrams(gets.chomp, gets.chomp)
