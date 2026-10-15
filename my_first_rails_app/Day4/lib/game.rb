


require_relative 'board'

class Game
    def initialize
        @board = Board.new
        @current_player = 'X'
    end


    def play
        puts "Welcome to Tic Tac Toe!"
        puts "-----------------------"

        loop do
            @board.display
            move = get_player_move

            @board.update(move, @current_player)


            if @board.winner?
                @board.display
                puts "Player #{@current_player} wins!"
                break
            elsif @board.full?
                @board.display
                puts "It's a draw!"
                break
            else
                switch_player
            end
        end

    end

    private

    def get_player_move
        loop do
            print "Player #{@current_player}, Choose your move (1-9): "
            input = gets.chomp

            if ['1', '2', '3', '4', '5', '6', '7', '8', '9'].include?(input)
                if @board.available?(input.to_i - 1)
                    return input.to_i - 1
                else
                    puts "Invalid move. Please try again."
                end
            else
                puts "Invalid move. Please try again."
            end
        end
    end


    def switch_player
        @current_player = @current_player == 'X' ? 'O' : 'X'
    end

end






