def commonChild(s1, s2)
  longest_child_length = s1.size
  return longest_child_length if s1 == s2
  
  while longest_child_length > 1
      longest_child_length -= 1
      return longest_child_length if s1.chars.combination(longest_child_length).any?{|comb| s2.chars.combination(longest_child_length).include?(comb)}
  end
  if s1.chars - s2.chars != s1.chars
      longest_child_length = 1
  else
      longest_child_length = 0
  end
  # (0..s1.size-1).each do |index| #s1 = ABCD
  #     substr = s1.chars.tap {|chars| chars.delete_at(index)} #substr = BCD
  #     if s2.chars.select{|c| substr.include?(c)} == substr
  #         p substr
  #         longest_child_length = substr.size
  #         return longest_child_length
  #     end 
  # end
  longest_child_length
end

# working solution (not mine)
# def commonChild(s1, s2)
#   m = s1.size
#   n = s2.size
#   num=Array.new(m + 1){Array.new(n + 1)}
  
#   for i in 0..m do
#       for j in 0..n do 
#           if i == 0 || j == 0
#               num[i][j] = 0
#           elsif s1[i-1] == s2[j-1]
#               num[i][j] = num[i-1][j-1] +1
#           else
#               num[i][j] = num[i-1][j] > num[i][j-1] ? num[i-1][j] : num[i][j-1]
#           end
#       end
#   end
# p num 
# num[m][n]
# end
#
# 

# Really unique solution that doesn't time out
# def commonChild(s1, s2)
#   m = Array.new(s1.size + 1, 0)

#   for i in 1..s1.size
#     new = Array.new(1, 0)

#     for j in 1..s2.size
#       new.push s1[i-1] == s2[j-1] ? m[j-1] + 1 : [new[j-1], m[j]].max
#     end

#     m = new
#   end

#   m.last
# end

# Explanation:
# This logic essentially tracks where in str2 a matching character was found and then increments that placeholder in m as well as all subsequent placeholders in m.

# Ex: m: [0, 0, 0, 1, 1, 2, 2, 3, 3, 3]

# This logic keeps proper track of the order of the matching characters by using m in this way. If a match further into s1 processing is found at the beginning of s2, then m will change accordingly.

# Ex: m: [0, 0, 0, 1, 1, 1] => [0, 1, 1, 1, 1, 1]

# The second matcing character in s2 was before the first from s1 so it is recorded but does not change the max length as the order is not correct.

# m.last is always the maximum length match after the O(n^2) operation.

# Note: m is initially instantiated with an extra palceholder to support the logic used in loop j. Specifically the false side of the ternary [new[j-1], m[j]].max.



start = Time.now
p commonChild("HARRY", "SALLY")
p commonChild("AA", "BB")
p commonChild("SHINCHAN", "NOHARAAA")
# p commonChild('ELGGYJWKTDHLXJRBJLRYEJWVSUFZKYHOIKBGTVUTTOCGMLEXWDSXEBKRZTQUVCJNGKKRMUUBACVOEQKBFFYBUQEMYNENKYYGUZSP', 'FRVIFOVJYQLVZMFBNRUTIYFBMFFFRZVBYINXLDDSVMPWSQGJZYTKMZIPEGMVOUQBKYEWEYVOLSHCMHPAZYTENRNONTJWDANAMFRX')
finish = Time.now

p finish-start