class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
    WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
        # Middle row
      # ETC, an array for each win combination
    ]
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
      user_input.to_i - 1
    end

    def move( index, character = "X")
      @board[index] = character
    end

    def position_taken?(location)
      @board[location] != " " && @board[location] != ""
    end

    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end

    def turn
      puts "Please enter 1-9:"
      answer = gets.strip
      index = input_to_index(answer)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end

    def turn_count
      turn = 0
      @board.each do |x|
        if x == "X" || x == "O"
          turn += 1
        end
      end
      turn
    end

    def current_player
       turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.find do |x|
          @board[x[0]] == @board[x[1]] &&
          @board[x[1]] == @board[x[2]] &&
          position_taken?(x[0])
      end
    end

    def full?
      @board.none? {|x| x == " "}
    end

    def draw?
      if full? && !won?
        true
      end
    end

    def over?
      if won? || full? || draw?
        true
      end
    end

    def winner
      if x = won?
        @board[x[0]]
    end
    end

    def play
      # turn until over?
      while !over?
        turn
      end
      # if winner
      #   puts "Congratulations #{winner}!"
      # end
      # if draw?
      #   puts "Cat's Game!"
      # end

      puts winner ? "Congratulations #{winner}!" : "Cat's Game!"

    end



end
