# [5, 1, 2, 3, 7, 8, 6, 4]

def minimumBribes(q)
  # Write your code here
  if q.map.with_index {|num, idx| num - 3 > idx}.any?
    puts "Too chaotic"
    return
  end
  bribes = 0
  new_arr = q.dup
  while new_arr != q.sort
    # break if bribes < 0
      new_arr.each.with_index do |int, idx|
        # break if bribes < 0
        p new_arr
        while new_arr[idx] != idx + 1 && bribes >= 0
          int = new_arr[idx]
          offset = (idx - (int -1)) * -1
          p offset
          # if offset < -2 || offset > 2
          #     # bribes = "Too chaotic"
          #     bribes = -100
          #     break
          # else
              new_arr.insert(idx + offset, new_arr.delete_at(idx))
              bribes += offset.abs
              break if new_arr == q.sort
          # end
        end
      end
  end
  # bribes = 3 if bribes == ""
  if bribes < 0
      puts "Too chaotic" 
  else
      puts bribes
  end
end

t = gets.strip.to_i

t.times do |t_itr|
    n = gets.strip.to_i

    q = gets.rstrip.split.map(&:to_i)

    minimumBribes q
end