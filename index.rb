class Player

  attr_accessor :hp, :name 

 def initialize(name, role)
    @name=name
    @role=role
    @hp = 10
 end

 def sayHi
    puts "My name is #{@name} and I'm gonna fight!"
 end
     
 def hit
    @hp = @hp-1
    #p1_hp - damage=(p2_str - p1_def - rand(1, p1_agi))
 end

 def guard
    #def = def + agi
 end

 def crit
    #p1_hp - damage=(p2_str - rand(1, p1_agi))
 end

 def giveup
    #spec
 end

 def surprize
    #spec
 end

end

class Battle

 def initialize(p1, p2)
    @p1 = p1 #player 1
    @p2 = p2 #player 2
    @turn = 1 #player1 starts
 end

 def turn
    if @turn == 1
     current_player = @p1
     @turn = 2
    else
     current_player = @p2
     @turn = 1
  end
   
    puts "#{current_player.name}, it's your turn!"
    current_player.sayHi
    current_player.hit
   
 end

 def startGame
 end

 def endGame
 end

end

# role hp str def agi
# vo   20 4   8   8
# gu   25 7   6   6
# ba   30 10  5   1
name = gets.chomp
puts "Hi there, #{name}\nNow, choose your role:\n"
roles = {"vo", "vocal", "gu", "guitar", "ba", "bass"}#, "dr", "drums"}
puts roles.map { |key, value| key+": " + value.to_s.capitalize }.join("\n")
role = gets.chomp
while !roles.has_key?(role)
 puts "Choose the role from the list!"
 role = gets.chomp
end
puts "Okay, so you want to be a #{roles[role]}ist, #{name}... Btw, how's your band called?"
band_name = gets.chomp
puts "So hey there, #{name}, a #{band_name}'s #{roles[role]}ist!"
p1 = Player.new(name, role)
p2 = Player.new('Enemy', 'vo')
battle = Battle.new(p1, p2)
battle.startGame
while (p1.hp > 0 || p2.hp > 0)
 battle.turn
 puts "You: #{p1.hp}; Enemy: #{p2.hp}"
end
battle.endGame