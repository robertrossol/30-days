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
  n = expenditure.size
  num_days_to_check = n - d 
  days_to_check = expenditure[d..-1]
  iteration = 0
  alerts = 0

  while iteration < num_days_to_check
    trailing_exps = expenditure[iteration...(iteration + d)]
    median = trailing_exps.sort[d / 2]
    median = d.odd? ? median : ((median + trailing_exps.sort[((d/2) - 1)]) / 2.0)
    
    alerts += 1 if days_to_check[iteration] >= median * 2
    iteration += 1
  end
  alerts
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

d = first_multiple_input[1].to_i

expenditure = gets.rstrip.split.map(&:to_i)

result = activityNotifications expenditure, d

fptr.write result
fptr.write "\n"

fptr.close()
