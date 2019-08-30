class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], # Horizontal
    [0,3,6], [1,4,7], [2,5,8], # Vertical
    [0,4,8], [2,4,6] # Diagonal
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if [nil, "", " "].include?(@board[index])
      false
    elsif ["X","O"].include?(@board[index])
      true
    end
  end
  
  def valid_move?(index)
    if position_taken?(index)
      false
    else
      index.between?(0,8)
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    turns = 0
    @board.each do |token|
      ["X","O"].include?(token) ? turns += 1 : nil
    end
    turns
  end
  
  def current_player
    tc = turn_count
    tc.even? ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all? { |i| @board[i] == "X"} or win_combo.all? { |i| @board[i] == "O"}
        return win_combo
      end
    end
    return false
  end
  
  def full?
    !@board.any? { |i| i == " " }
  end
  
  def draw?
    if !won? & full?
      true
    else
      false
    end
  end
  
  def over?
    won? or draw?
  end
  
  def winner
    if won?
      @board[won?[0]]
    end
  end
  
  # Define your play method below
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
end