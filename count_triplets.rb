def countTriplets(arr, r)
  end
  arr.combination(3).select do |t|
      t[0]*r == t[1] && t[0]*(r*r) == t[2] 
  end.size
end