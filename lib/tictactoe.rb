class Game
  @@array=[1,2,3,4,5,6,7,8,9]
  @@array_chart = ["X","O"]
  @@index_chart = 0
  @@player_turn = ""
  @@cont_turns = 0
  def Game.cont_turns(opc="get")
    if opc == "reset"
      @@cont_turns = 0
    else
      @@cont_turns
    end
  end
  def Game.reset
    @@array=[1,2,3,4,5,6,7,8,9]
  end
  def Game.draw_board()
    ["\t \t|\t \t|\t \t",
      "\t#{@@array[0]}\t|\t#{@@array[1]}\t|\t#{@@array[2]}\t",
      "_______\t_______\t|_____\t_______\t|______\t_______\t",
      "\t \t|\t \t|\t \t",
      "\t#{@@array[3]}\t|\t#{@@array[4]}\t|\t#{@@array[5]}\t",
      "_______\t_______\t|_____\t_______\t|______\t_______\t",
      "\t \t|\t \t|\t \t",
      "\t#{@@array[6]}\t|\t#{@@array[7]}\t|\t#{@@array[8]}\t",
      "\t \t|\t \t|\t \t"]
  end
  
end

class Player < Game
  def initialize(name)
    @name=name
    @chart = @@array_chart[@@index_chart]
    @@index_chart +=1
  end


  private
  def probe_winner
    if @@array[0] == @chart and @@array[1] == @chart and @@array[2] == @chart
      print "\n \n #{@name} win! with: #{@chart} \n \n"
      return -1
    elsif @@array[3] == @chart and @@array[4] == @chart and @@array[5] == @chart
      print "\n \n #{@name} win! with: #{@chart} \n \n"
      return -1
    elsif @@array[6] == @chart and @@array[7] == @chart and @@array[8] == @chart
      print "\n \n #{@name} win! with: #{@chart} \n \n"
      return -1
    elsif @@array[0] == @chart and @@array[3] == @chart and @@array[6] == @chart
      print "\n \n #{@name} win! with: #{@chart} \n \n"
      return -1
    elsif @@array[1] == @chart and @@array[4] == @chart and @@array[7] == @chart
      print "\n \n #{@name} win! with: #{@chart} \n \n"
      return -1
    elsif @@array[2] == @chart and @@array[5] == @chart and @@array[8] == @chart
      print "\n \n #{@name} win! with: #{@chart} \n \n"
      return -1
    elsif @@array[0] == @chart and @@array[4] == @chart and @@array[8] == @chart
      print "\n \n #{@name} win! with: #{@chart} \n \n"
      return -1
    elsif @@array[6] == @chart and @@array[4] == @chart and @@array[2] == @chart
      print "\n \n #{@name} win! with: #{@chart} \n \n"
      return -1
    else
      @@cont_turns +=1
      return 1
    end
  end
    
    
  public
  def name_player
    @name
  end
  def chart_player
    @chart
  end

  def select_space(number)
    @@player_turn = @name
    if @@array.include?(number)
      @@array.map!{|element| element == number ? element = @chart : element}
      return probe_winner
    else
      return 0
    end
  end
end

end_game = false
opc = ""
puts "Welcome to TIC TAC TOE Game"
puts Game.draw_board
puts "2 players play the game and to exit enter: exit"
print "Enter name player1: "
player1=Player.new(gets.chomp)
print "Enter name player2: "
player2=Player.new(gets.chomp)
parcial_game = false
puts "The game start with player1 (#{player1.chart_player}): #{player1.name_player} and player2 (#{player2.chart_player}): #{player2.name_player} "

while end_game == false do
  ok_p1 = false
  ok_p2 = false

  while ok_p1 == false do
    puts Game.draw_board
    print "Turn #{player1.name_player}, chose a available number: "
    opc = gets.chomp
    if opc == "exit"
      
      end_game = true
      break
    elsif opc.to_i >0 and opc.to_i < 10
      opc2 = player1.select_space(opc.to_i)
      if opc2 == -1
        parcial_game = true
        ok_p1 = true
      elsif opc2 == 1
        ok_p1 = true
      else
        puts "Enter incorrect!: Enter a available number, \n see the board\n"
      end
    else
      puts "Enter incorrect!: Enter a available number, \n see the board\n"
    end
  end
  if parcial_game == false and end_game == false and Game.cont_turns < 9
    while ok_p2 == false do
      puts Game.draw_board
      print "Turn #{player2.name_player}, chose a available number: "
      opc = gets.chomp
      if opc == "exit"
        end_game = true
        break
      elsif opc.to_i >0 and opc.to_i < 10
        opc2 = player2.select_space(opc.to_i)
        if opc2 == -1
          parcial_game = true
          ok_p2 = true
        elsif opc2 == 1
          ok_p2 = true
        else
          puts "Enter incorrect!: Enter a available number, \n see the board\n"
        end
      else
        puts "Enter incorrect!: Enter a available number, \n see the board\n"
      end
    end
  end
  if parcial_game == true or Game.cont_turns >=9
    puts Game.draw_board
    puts Game.cont_turns >= 9 ? "TIED GAME - NOBODY LOSE\n" : "\n"
    puts "Do you want to play again ? y/n: "
    if gets.chomp == "y"
      Game.reset
      parcial_game = false
      puts "The game start with player1 (#{player1.chart_player}): #{player1.name_player} and player2 (#{player2.chart_player}): #{player2.name_player} "
      Game.cont_turns("reset")
    else
      end_game = true
    end
  end
end
puts "Thank's for play"


