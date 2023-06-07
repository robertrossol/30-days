#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'activityNotifications' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY expenditure
#  2. INTEGER d
#

def activityNotifications(expenditure, d)

  def median(sorted_arr, d) 
    median = sorted_arr[d / 2]
    median = (median + sorted_arr[((d/2) - 1)]) / 2.0 if d.even? 
    median
  end

  def next_it(sub_arr, next_val)
    sub_arr.shift
    sub_arr << next_val
  end
  n = expenditure.size
  num_days_to_check = n - d 
  days_to_check = expenditure[d..-1]
  iteration = 0
  alerts = 0
  # indices = d.odd? ? d/2 :  
  trailing_exps = expenditure[0...d]

  while iteration < num_days_to_check
    # sorted = trailing_exps.sort
    median = median(trailing_exps.sort, d)
    # median = sorted[d / 2]
    # median = d.odd? ? median : ((median + sorted[((d/2) - 1)]) / 2.0)
    todays_value = days_to_check[iteration]
    alerts += 1 if todays_value >= median * 2
    next_it(trailing_exps, todays_value)
    # p trailing_exps
    iteration += 1
  end
  alerts
end

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')

# first_multiple_input = gets.rstrip.split

# n = first_multiple_input[0].to_i

# d = first_multiple_input[1].to_i

# expenditure = gets.rstrip.split.map(&:to_i)

# result = activityNotifications expenditure, d

# fptr.write result
# fptr.write "\n"

# fptr.close()
y = Time.now
p activityNotifications([9, 5, 2, 3, 4, 2, 3, 6, 8, 4, 5], 5)
p activityNotifications([1,2,3,4,4], 4)
p activityNotifications([10,20,30,40,50], 3)
x = []
(1..2000).each {|val| x << val}
# p x
p activityNotifications(x, 50)

p Time.now - y