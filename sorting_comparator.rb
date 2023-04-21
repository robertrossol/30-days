class Player
  attr_reader :name, :score
  
  def initialize(name, score)
    @name = name
    @score = score
  end
end

class Checker
  def self.compare(p1, p2)
    if p1.score > p2.score
      -1
    elsif p1.score < p2.score
      1
    else
      p1.name > p2.name ? 1 : 0
    end
  end
end

n = gets.chomp
data = []

for _ in 0..n.to_i - 1
  input = gets.chomp.split(' ')
  data.push(Player.new(input[0], input[1].to_i))    
end

# comment out the above for loop and uncomment the next line for quicker testing:
# data.push(Player.new("smith", "20".to_i), Player.new("jones", "15".to_i), Player.new("jones", "20".to_i))    

data = data.sort do |player1, player2|
  Checker.compare(player1, player2)
end
 
data.each {|player| puts "#{player.name} #{player.score}"}

