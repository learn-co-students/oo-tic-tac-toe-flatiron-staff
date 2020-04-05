class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    board = @board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    "#{user_input}".to_i - 1
  end

  def move(index, playertoken = X)
    @board[index] = playertoken
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index) == true
      return false
    elsif index<0
      return false
    elsif index>8
      return false
    else
      return true
    end
  end

  def turn_count
    counter = 0
      @board.each do |index|
        if index == "X"
          counter += 1
        elsif index == "O"
          counter += 1
        end
      end
    return counter
  end

  def current_player
    @board.each do |index|
      return turn_count % 2 == 0 ? "X" : "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets
    index = input_to_index(user_input)
    playertoken = current_player
    if valid_move?(index)
      move(index, playertoken)
      display_board
    else turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do | combo |
    if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
      return combo
    end
    end
    false
  end

  def full?
    @board.detect do | position |
    if position == " " || position == "" || position == nil
      return false
    end
    end
    true
  end

  def draw?
    if won? == false && full? == true
      return true
    end
    false
  end

  def over?
    if won? == true || draw? == true || full? == true
      return true
    elsif full? == false && won? != false
      return true
    end
    return false
  end

  def winner
    win_positions = won?
    if won?
      return @board[win_positions[0]]
    else
      return nil
    end
  end

  def play
    if over?
      playertoken = winner
      if won?
        puts "Congratulations #{playertoken}!"
      else draw?
        puts "Cat's Game!"
      end
    else
      turn
      play
    end
  end

end
