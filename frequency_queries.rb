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
    outputs.each do |val|
      puts val
    end
end

q = gets.strip.to_i

queries = Array.new(q)

q.times do |i|
  queries[i] = gets.rstrip.split.map(&:to_i)
end

ans = freqQuery(queries)

