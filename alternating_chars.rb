#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'alternatingCharacters' function below.
#
# The function is expected to return an INTEGER.
# The function accepts STRING s as parameter.
#

def alternatingCharacters(s)
  deletions = 0
  current_val = s[0]
  s.split('')[1..-1].each do |char|
    if char == current_val
      deletions += 1
    else
      current_val = char
    end
  end
  deletions
end

# First Attempt Solution:
# def alternatingCharacters(s)
#     # Write your code here
#     deletions = 0
#     current_val = s[0]
#     s.split('').each.with_object([]) do |char, arr|
#         if char == current_val
#             current_val == "A" ? current_val = "B" : current_val = "A"
#         else
#             deletions += 1
#         end
#     end
#     deletions
# end


fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.strip.to_i

q.times do |q_itr|
    s = gets.chomp

    result = alternatingCharacters s

    fptr.write result
    fptr.write "\n"
end

fptr.close()
