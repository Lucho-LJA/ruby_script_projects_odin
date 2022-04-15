class Game
    @@validColor = []
    @@colors = ["RED","GREEN","BLUE","YELLOW"]
    @@random = Random.new

    public
    def Game.generate_pass
        @@validColor = [ Game.random_color,  Game.random_color,  Game.random_color,  Game.random_color]
    end

    private

    def validAnswer(arrayColor)
        state = []
        auxIndex = []
        arrayColor.each_with_index do |color,index|
            if color == @@validColor[index]
                state.push("Check")
                auxIndex.push(index)
            end
        end
        @@validColor.each_with_index do |color,index|
            unless auxIndex.include?(index)
                p color
                if arrayColor.include?(color) then state.push("Good") end
            end
        end
        n=4-state.length
        for i in 0...n do
            state.push(" - ")
        end
        return  state
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

    def test(colors) 
        p "test"
        validAnswer(colors)
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
        puts "#{name} select the modo game"
        puts "(1) You are the player"
        puts "(2) You are the master"
        puts "(3) Exit"
        return gets.chomp
    end
end

#Program principal
player=Player.new(Game_steps.title)
Game_steps.mode_game(player.get_name)