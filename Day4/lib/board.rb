

class Board
    WINNING_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
].freeze


def grid
    @grid
end


def initialize
    @grid = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
end


def display
    puts "\n"
    puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
    puts "---+---+---"
    puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
    puts "---+---+---"
    puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
    puts "\n"
end


def update(index, marker)
    @grid[index] = marker
end


def available?(index)
    @grid[index] != 'X' && @grid[index] != 'O'
end


def full?
    @grid.all? { |cell| cell == 'X' || cell == 'O' }
end


def winner?
    WINNING_COMBINATIONS.each do |combination|
        if combination.all? { |index| @grid[index] == 'X' }
            return 'X'
        elsif combination.all? { |index| @grid[index] == 'O' }
            return 'O'
        end
    end
    nil
end







