#!/bin/ruby

require 'json'
require 'stringio'

# Complete the freqQuery function below.
def freqQuery(queries)
  arr = []
  outputs = []
  values_hash = Hash.new(0)

  queries.each do |command, value|
    case command
    when 1
      arr << value
      values_hash[value] += 1
    when 2
      if arr.include?(value)
        arr.delete_at(arr.index(value))
        values_hash[value] -= 1
      end
    when 3
      outputs << (values_hash.values.include?(value) ? 1 : 0)
    end
  end
  # outputs.each do |val|
  #   puts val
  # end
  outputs
end

p freqQuery([[3, 4], [2, 1003], [1, 16], [3, 1]]) # should output [0, 1]
