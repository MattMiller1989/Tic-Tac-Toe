
class Game_board
        attr_accessor :curr_board
      
    def create_board
        @curr_board=[[" "," "," "],
                    ["-","-","-"],
                    [" "," "," "],
                    ["-","-","-"],
                    [" "," "," "]]
    end
    def update_board(symbol,choice)
        
        @curr_board[choice[0]*2][choice[1]]=symbol
    end
    
    def check_move?(choice)
        return @curr_board[choice[0]*2][choice[1]]==" "        
    end

    def check_for_winner(winner)
        left_col=[@curr_board[0][0],@curr_board[2][0],@curr_board[4][0]]
        mid_col=[@curr_board[0][1],@curr_board[2][1],@curr_board[4][1]]
        right_col=[@curr_board[0][2],@curr_board[2][2],@curr_board[4][2]]
        diag_one=[@curr_board[0][0],@curr_board[2][1],@curr_board[4][2]]
        diag_two=[@curr_board[4][0],@curr_board[2][1],@curr_board[0][2]]

        winning=[left_col,mid_col,right_col,diag_one,diag_two]
        
        winning.each do |lane|
            if lane.all? {|element| element.to_s==winner}
                return true
            end
        end 
        
        @curr_board.each do |row|
           if row.all? {|loc| loc.to_s==winner}
                return true
            end

        end
    end
    
    def cats_game
        @curr_board.each do |c|
            if c.any?{|x| x.to_s == " "}
                 return false
            
                
            end
 
         end
         return true
    end
    
    def print_board
        @curr_board.each do |row|
            print row.join("|")
            puts 
        end
    end

    def reset
        @curr_board=[[" "," "," "],
                    ["-","-","-"],
                    [" "," "," "],
                    ["-","-","-"],
                    [" "," "," "]]
    end
end

class Game_runner
    @@game_over=false
    
    def initialize
        @my_board=Game_board.new
        @my_board.create_board
        startgame
    end
    def startgame
        
        while !@@game_over
            player_choice=get_player_choice()
            @my_board.update_board("X",player_choice)
            
             if @my_board.check_for_winner("X") == true
                 @@game_over=true
                 declare_winner("X")
             elsif @my_board.cats_game == true
                 @@game_over=true
                 declare_draw
             else
                 computer_choice=get_computer_choice()
                 @my_board.update_board("O",computer_choice)

                 if @my_board.check_for_winner("O") == true
                     @@game_over=true
                     declare_winner("O")
                 elsif @my_board.cats_game == true
                    @@game_over=true
                    declare_draw
                 end    
             end
             @my_board.print_board
        end

        puts "Do you want to play again?[y/n]"
        if gets.chomp== "y"
            @my_board.reset
            @@game_over=false
            startgame
        end


    end

    def get_player_choice
        good_move=false

        while(!good_move)
            valid_input=false
            accepted_input=/(^[0-2] [0-2]$)/
                while !valid_input
                    puts "Please enter your move ex. 0 0; 1 2; 2 2: "
                    choice=gets.chomp
                    if choice.match(accepted_input)
                        valid_input=true
                    else
                        puts "Please enter a valid location"
                    end 
                end

            choice=choice.split(" ").map(&:to_i)
            if @my_board.check_move?(choice)
                good_move=true
                return choice
            end
        end
    end

    def get_computer_choice
        good_move=false

        while(!good_move)
            x_loc=rand 3
            y_loc=rand 3
            choice=[x_loc,y_loc]
            if @my_board.check_move?(choice)
                good_move=true
                return choice
            end
        end
    end

    def declare_winner(winner)
        if winner=="X"
            puts "YOU WON!!! GOOD JOB YOU FUCKING NERD"
        else
            puts "YOU LOST.. YOU SUCK.. NOT MUCH ELSE TO SAY"
        end
    end

    def declare_draw
        puts "CATS GAME YOU ARE A FUCKING LOSER"
    end

end

# my_runner=Game_runner.new