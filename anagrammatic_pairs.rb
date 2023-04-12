
def sherlockAndAnagrams(s)
  def split_word(s)
      0.upto(s.length - 1).flat_map do |start| 
          1.upto(s.length - start).map do |length| 
              s[start, length].chars.sort.join("")
          end
      end.reduce(Hash.new(0)) {|hsh, substr| hsh[substr] += 1; hsh}
  end
  split_word(s).values.select{|val| val > 1}.map {|int| (0..(int - 1)).reduce(&:+)}.reduce(&:+) || 0
end

p sherlockAndAnagrams("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
p sherlockAndAnagrams("mhmgmbbccbbaffhbncgndbffkjbhmkfncmihhdhcebmchnfacdigflhhbekhfejblegakjjiejeenibemfmkfjbkkmlichlkbnhc")
p sherlockAndAnagrams("fdacbaeacbdbaaacafdfbbdcefadgfcagdfcgbgeafbfbggdedfbdefdbgbefcgdababafgffedbefdecbaabdaafggceffbacgb")