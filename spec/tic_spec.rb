require_relative '../Tic-Tac-Toe'

describe Game_board do 
    describe '#check_for_winner' do
        before(:each) do
            @test_game=Game_board.new
            @test_board= double('curr_board')
        end
        
        def create_lane(arr)

            @test_game.curr_board=arr

            
        end

        it "returns value when top row is full of same symbol" do
            create_lane([["X","X","X"],
                        ["-","-","-"],
                        [" "," "," "],
                        ["-","-","-"],
                        [" "," "," "]])
            expect(@test_game.check_for_winner('X')).to eql(true)

        end
        it "returns value when middle row is full of same symbol" do
            create_lane([["O","X","O"],
                        ["-","-","-"],
                        ["X","X","X"],
                        ["-","-","-"],
                        [" "," "," "]])
            expect(@test_game.check_for_winner('X')).to eql(true)

        end
        it "returns value when bottom row is full of same symbol" do
            create_lane([["O","X","O"],
                        ["-","-","-"],
                        ["X"," ","X"],
                        ["-","-","-"],
                        ["O","O","O"]])
            expect(@test_game.check_for_winner('O')).to eql(true)

        end
        it "returns value when left col is full of same symbol" do
            create_lane([["O","X","O"],
                        ["-","-","-"],
                        ["O","X","X"],
                        ["-","-","-"],
                        ["O","X","X"]])
            expect(@test_game.check_for_winner('X')).to eql(true)

        end

        it "returns false when conditions not met" do
            create_lane([["O","X","O"],
                        ["-","-","-"],
                        ["X"," ","X"],
                        ["-","-","-"],
                        ["O","X","X"]])
            expect(@test_game.check_for_winner('X')).not_to eql(true)

        end

        

    end
end