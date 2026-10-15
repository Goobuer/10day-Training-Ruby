

require_relative '../Course_Exercises/Connect_Four'

RSpec.describe ConnectFour do
    let(:game) { ConnectFour.new }
    
    describe '#initialize' do
        it 'initializes a board with 6 rows and 7 columns' do
        expect(game.board.size).to eq(6)
        expect(game.board.first.size).to eq(7)
        end
    end
    
    describe '#drop_piece' do
        it 'drops a piece into the specified column' do
        game.drop_piece(0, 'X')
        expect(game.board[5][0]).to eq('X')
        end
    
        it 'raises an error if the column is full' do
        6.times { game.drop_piece(0, 'X') }
        expect { game.drop_piece(0, 'O') }.to raise_error("Column is full")
        end
    end
    
    describe '#check_winner' do
        it 'detects a horizontal win' do
        4.times { |i| game.drop_piece(i, 'X') }
        expect(game.check_winner).to eq('X')
        end
    
        it 'detects a vertical win' do
        4.times { game.drop_piece(0, 'O') }
        expect(game.check_winner).to eq('O')
        end
    
        it 'detects a diagonal win' do
        game.drop_piece(0, 'X')
        game.drop_piece(1, 'O')
        game.drop_piece(1, 'X')
        game.drop_piece(2, 'O')
        game.drop_piece(2, 'O')
        game.drop_piece(2, 'X')
        game.drop_piece(3, 'O')
        game.drop_piece(3, 'O')
        game.drop_piece(3, 'O')
        game.drop_piece(3, 'X')
    
        expect(game.check_winner).to eq('X')
        end
    end
end


