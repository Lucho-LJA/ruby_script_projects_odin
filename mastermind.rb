class Game
    @@validColor = []
    @@colors = ["RED","GREEN","BLUE","YELLOW"]
    @@random = Random.new
    @@valid_color_pc = ["-","-","-","-"]

    public
    def Game.generate_pass
        @@validColor = [ Game.random_color,  Game.random_color,  Game.random_color,  Game.random_color]
    end

    private
    def Game.generate_answer
        answer_generated = []
        @@valid_color_pc.each do |color|
            if color == "-"
                answer_generated.push(Game.random_color)
            else
                answer_generated.push(color)
            end
        end
        answer_generated
    end

    def validAnswer_pc(arrayColor)
        state = []
        auxIndex = []
        puts arrayColor.inspect
        arrayColor.each_with_index do |color,index|
            if color == @@validColor[index]
                @@valid_color_pc[index] = color
                state.push("Check")
                auxIndex.push(index)
            end
        end
        @@validColor.each_with_index do |color,index|
            unless auxIndex.include?(index)
                if arrayColor.include?(color) then state.push("Good") end
            end
        end
        n=4-state.length
        for i in 0...n do
            state.push(" - ")
        end
        print state
        puts ""
        return  winner?(state)
    end

    def play_pc(array)
        @@validColor = array
        count = 12
        while count > 0
            puts "PC's Trie: #{12 + 1 - count}"
            validAnswer_pc(Game.generate_answer) ? break : count -=1
        end
        if count > 0
            puts "\n The PC win! with #{12 + 1 - count} Tries \n"
            @@valid_color_pc = ["-","-","-","-"]
        else
            puts "\n You Win! - The PC isn't intelligent \n"
            @@valid_color_pc = ["-","-","-","-"]
        end
    end

    def validAnswer(arrayColor)
        state = []
        auxIndex = []
        puts arrayColor.inspect
        arrayColor.each_with_index do |color,index|
            if color == @@validColor[index]
                state.push("Check")
                auxIndex.push(index)
            end
        end
        @@validColor.each_with_index do |color,index|
            unless auxIndex.include?(index)
                if arrayColor.include?(color) then state.push("Good") end
            end
        end
        n=4-state.length
        for i in 0...n do
            state.push(" - ")
        end
        print state
        puts ""
        return  winner?(state)
    end

    def winner?(states)
        states.all?{|state| state == "Check"}
    end

    def Game.random_color
        @@colors[@@random.rand(4)]
    end
end

class Player < Game
    def initialize(name)
        @name = name
    end

    def get_name
        @name
    end

    def play_rond(colors) 
        validAnswer(colors)
    end

    def pc_game(colors)
        puts "The colors code is: #{colors}"
        play_pc(colors)
    end
    def get_answer
        @@validColor
    end

end

#General function
module Game_steps
    def Game_steps.title
        puts "Welcome to MASTERMIND Game"
        puts "2 players play the game (Human vs Machine) and to exit enter: exit"
        print "Enter name player: "
        return gets.chomp
    end
    def Game_steps.mode_game(name)
        puts "#{name} select the modo game \n"
        puts "(1) You are the player"
        puts "(2) You are the master"
        puts "(3) Exit"
        return gets.chomp
    end
    def Game_steps.inputData(array)
        arrayColor = []
        if array.length == 4 and array.join('') != "exit"
            array.each do |color|
                case color
                when "r"
                    arrayColor.push("RED")
                when "g"
                    arrayColor.push("GREEN")
                when "b"
                    arrayColor.push("BLUE")
                when "y"
                    arrayColor.push("YELLOW")
                else
                    return []
                end
            end
        elsif array.join('') == "exit"
            return ["e","x","i","t"]
        else
            return []
        end
        return arrayColor
    end
end

#Program principal

end_game = false
option_mode = 0
player=Player.new(Game_steps.title)
while end_game == false
    while option_mode < 1 or option_mode > 3 do
        option_mode = Game_steps.mode_game(player.get_name).to_i
    end
    if option_mode == 1 
        cont_games = 12
        rond = true
        Game.generate_pass
        while cont_games > 0 and rond == true do
            puts "Enter the colors's code r-red, g-green, b-blue, y-yellow (Example: rgby)"
            print "#{12 + 1 - cont_games} Trie: "
            answer = Game_steps.inputData(gets.chomp.split(''))
            if answer.length == 4 and answer.join('') != "exit"
                if player.play_rond(answer)
                    cont_games -= 1
                    puts "\n You Win with #{12-cont_games} tries \n"
                    rond = false
                else
                    cont_games -= 1
                end
            elsif answer.join('') == "exit"
                puts "\n"
                rond = false
                option_mode = 0
            else
                puts "\n \n Enter available data (Ex: rgby) \n \n"
            end
            if cont_games < 1
                puts "\n You Lose! \n"
                puts "The answer is: #{player.get_answer}"
            end
        end
    elsif option_mode == 2
        rond = true
        while rond == true do
            puts "Enter the colors's code r-red, g-green, b-blue, y-yellow (Example: rgby)"
            code_color = Game_steps.inputData(gets.chomp.split(''))
            if code_color.length == 4 and code_color.join('') != "exit"
                player.pc_game(code_color)
                rond = false
            elsif code_color.join('') == "exit"
                puts "\n"
                rond = false
                option_mode = 0
            else
                puts "\n \n Enter available data (Ex: rgby) \n \n"
            end
        end

    elsif option_mode == 3
        end_game = true
    end
end
puts "\n Thank's for play"