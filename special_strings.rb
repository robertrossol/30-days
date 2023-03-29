#!/bin/ruby

require 'json'
require 'stringio'

#inefficient (O^N^2)
# def substrCount(n, s)
#   count = 0
#   (0..n-1).each do |sidx|
#       (sidx..n-1).each do |eidx|
#         str = s[sidx..eidx].squeeze
#         str.size == 1 || str.size == 3 && str == str.reverse ? count += 1 : next
#       end
#   end
#   count
# end

def get_sum_for_multichar_string(n)
  (n*(n+1))/2 - n
end

# Complete the substrCount function below.
def substrCount(n, s)
    c_idx = 0
  total_special_palindromes = 0
  
  while c_idx < n
    length_found = 1
    found_char = s[c_idx]
    while(c_idx + 1 < n and s[c_idx + 1] == found_char)
      length_found +=1
      c_idx +=1
    end

    # add
    if length_found > 1
      total_special_palindromes += get_sum_for_multichar_string(length_found)
    else #lookback and forth
      lookup_offset = 1
      while c_idx + lookup_offset < n and c_idx - lookup_offset >= 0
        looking_char = s[c_idx - lookup_offset] if lookup_offset == 1
        prev_chr = s[c_idx - lookup_offset]
        next_chr = s[c_idx + lookup_offset]
        break if prev_chr != next_chr or prev_chr != looking_char or next_chr != looking_char
        total_special_palindromes += 1
        lookup_offset += 1
      end
    end
    c_idx += 1
  end

  total_special_palindromes += n
  total_special_palindromes
end

#recursive but not efficient
# def substrCount(n,s)
#   sub_strings = lambda do |s|
#       return 0 if s.size < 1
#       (((0..s.size-1).map do |pos|
#           s[0..pos]
#       end).map do |str|
#           x = str.dup
#           str = str.squeeze
#           str.size == 1 || (str.size == 3 && str == str.reverse && x == x.reverse && x.count(str[1]) == 1) ? 1 : 0
#       end.reduce(&:+) + sub_strings.call(s[1..-1]))
#   end
#   sub_strings.call(s)
# end

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')

# n = gets.to_i

# s = gets.to_s.rstrip

# result = substrCount n, s

# fptr.write result
# fptr.write "\n"
start = Time.now
# fptr.close()
p substrCount(32, 'asasfkrjfsfkmkfokasmdaaaoaadmqwd')
p substrCount(5, 'aaaaa')
p substrCount(7, 'abcbaba')
p substrCount(902, "ccacacabccacabaaaabbcbccbabcbbcaccabaababcbcacabcabacbbbccccabcbcabbaaaaabacbcbbbcababaabcbbaaababababbabcaabcaacacbbaccbbabbcbbcbacbacabaaaaccacbaabccabbacabaabaaaabbccbaaaabacabcacbbabbacbcbccbbbaaabaaacaabacccaacbcccaacbbcaabcbbccbccacbbcbcaaabbaababacccbacacbcbcbbccaacbbacbcbaaaacaccbcaaacbbcbbabaaacbaccaccbbabbcccbcbcbcbcabbccbacccbacabcaacbcaccabbacbbccccaabbacccaacbbbacbccbcaaaaaabaacaaabccbbcccaacbacbccaaacaacaaaacbbaaccacbcbaaaccaabcbccacccacacabccacabaaaabbcbccbabcbbcaccabaababcbcacabcabacbbbccccabcbcabbaaaaabacbcbbbcababaabcbbaaababababbabcaabcaacacbbaccbbabbcbbcbacbacabaaaaccacbaabccabbacabaabaaaabbccbaaaabacabcacbbabbacbcbccbbbaaabaaacaabacccaacbcccaacbbcaabcbbccbccacbbcbcaaabbaababacccbacacbcbcbbccaacbbacbcbaaaacaccbcaaacbbcbbabaaacbaccaccbbabbcccbcbcbcbcabbccbacccbacabcaacbcaccabbacbbccccaabbacccaacbbbacbccbcaaaaaabaacaaabccbbcccaacbacbccaaacaacaaaacbbaaccacbcbaaaccaabcbccac")
finish = Time.now
p diff = finish -start