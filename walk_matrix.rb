# @param {List[List[int]]} matrix
# @return {List[int]}

matrix = [
  [0, 1, 2, 3],
  [11, 12, 13, 4],
  [10, 15, 14, 5],
  [9, 8, 7, 6]
]
matrix2 = [
  [0, 1, 2, 3, 4],
  [15, 16, 17, 18, 5],
  [14, 23, 24, 19, 6],
  [13, 22, 21, 20, 7],
  [12, 11, 10, 9, 8]
]

def walk_matrix(matrix)
  path = []

  iteration = 0
  while matrix.size > 0
    rows = [matrix[0], matrix.transpose[-1], matrix[-1].reverse, matrix.transpose[0].reverse]
    row = rows[(iteration % 4)]
    path << row
    case (iteration % 4)
    when 0
      matrix = matrix[1..-1]
    when 1
      matrix.map! {|row| row[0..-2]}
    when 2
      matrix = matrix[0..-2]
    when 3
      matrix.map! {|row| row[1..-1]}
    end
    iteration += 1
  end
  path.flatten
end

p walk_matrix(matrix)
p walk_matrix(matrix2)
p walk_matrix(matrix3)