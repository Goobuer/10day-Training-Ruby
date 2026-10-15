class ConnectFour
  ROWS = 6
  COLUMNS = 7
  WINNING_DIRECTIONS = [[0, 1], [1, 0], [1, 1], [1, -1]].freeze

  attr_reader :board

  def initialize
    @board = Array.new(ROWS) { Array.new(COLUMNS, " ") }
    @current_player = "X"
  end

  def play
    loop do
      display_board
      column = get_column_input
      return if column.nil?

      if board[0][column] != " "
        puts "Column #{column + 1} is full. Try again."
        next
      end

      drop_piece(column)

      if check_winner
        display_board
        puts "Player #{@current_player} wins!"
        break
      elsif board_full?
        display_board
        puts "It's a draw!"
        break
      end

      switch_player
    end
  end

  def drop_piece(column, marker = @current_player)
    unless column.is_a?(Integer) && column.between?(0, COLUMNS - 1)
      raise ArgumentError, "Column must be between 0 and #{COLUMNS - 1}"
    end
    raise ArgumentError, "Marker must be \"X\" or \"O\"" unless %w[X O].include?(marker)

    row = board.rindex { |cells| cells[column] == " " }
    raise "Column is full" unless row

    board[row][column] = marker
  end

  def check_winner
    board.each_index do |row|
      board[row].each_index do |column|
        marker = board[row][column]
        next if marker == " "

        WINNING_DIRECTIONS.each do |row_delta, column_delta|
          end_row = row + row_delta * 3
          end_column = column + column_delta * 3
          next unless end_row.between?(0, ROWS - 1) && end_column.between?(0, COLUMNS - 1)

          return marker if (1..3).all? do |step|
            board[row + row_delta * step][column + column_delta * step] == marker
          end
        end
      end
    end

    nil
  end

  def board_full?
    board.all? { |row| row.none?(" ") }
  end

  private

  def display_board
    puts "\nCurrent Board:"
    board.each do |row|
      puts row.map { |cell| cell == " " ? "." : cell }.join(" | ")
    end
    puts "-" * 29
    puts (1..COLUMNS).to_a.join("   ")
  end

  def get_column_input
    loop do
      print "Player #{@current_player}, choose a column (1-#{COLUMNS}): "
      input = gets
      return if input.nil?

      input = input.chomp
      return input.to_i - 1 if input.match?(/\A\d+\z/) && input.to_i.between?(1, COLUMNS)

      puts "Invalid input. Please enter a number between 1 and #{COLUMNS}."
    end
  end

  def switch_player
    @current_player = @current_player == "X" ? "O" : "X"
  end
end

ConnectFour.new.play if $PROGRAM_NAME == __FILE__
