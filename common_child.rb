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

p commonChild("HARRY", "SALLY")
p commonChild("AA", "BB")
p commonChild("SHINCHAN", "NOHARAAA")