class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }
  end
  
  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
  end
  
  #display the game board
  def display
    grid.each { |line| p line }
  end
  
  #determines if there is a winner present on the board
  def won?
    won_checker
  end
  
  #dialog in response to a tie game
  def tie
    puts "It's a draw! Nobody wins :("
  end
  
  #displays message to the winner
  def winner(player)
    puts "Congratulations #{player}! You win!"
  end
  
  #checks if the position on the board is empty or not
  def empty?(*pos)
    self[*pos].nil?
  end

  #places mark on chosen position 
  def place_mark(*pos, mark)
    if !valid_move?(*pos)
      pos = off_board_error
      self[*pos] = mark
    elsif !empty?(*pos)
      pos = pos_error
      self[*pos] = mark
    else
      self[*pos] = mark
    end
  end

=begin
# OLD (NOW) WORKING CODE ~

  def place_mark(*pos, mark)
    if valid_move?(*pos) && empty?(*pos)  # if empty and valid, then place mark
      self[*pos] = mark
    elsif !valid_move?(*pos)              # if not valid, put out error
      pos = off_board_error
      self[*pos] = mark
    else                                  # if not empty, put out error
      pos = pos_error
      self[*pos] = mark
    end
  end
=end

  #returns array of empty locations
  def empty_position
    vacancies = []
    grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        vacancies << [row_idx, col_idx] if grid[row_idx][col_idx].nil?
      end
    end
    vacancies
  end
  
  private
  
  #winning conditions
  def won_checker
    if (self[0,0] != nil && self[0,0] == self[0,1] && self[0,1] == self[0,2]) || 
       (self[1,0] != nil && self[1,0] == self[1,1] && self[1,1] == self[1,2]) ||
       (self[2,0] != nil && self[2,0] == self[2,1] && self[2,1] == self[2,2]) ||
       (self[0,0] != nil && self[0,0] == self[1,0] && self[1,0] == self[2,0]) ||
       (self[0,1] != nil && self[0,1] == self[1,1] && self[1,1] == self[2,1]) ||
       (self[0,2] != nil && self[0,2] == self[1,2] && self[1,2] == self[2,2]) ||
       (self[0,0] != nil && self[0,0] == self[1,1] && self[1,1] == self[2,2]) ||
       (self[0,2] != nil && self[0,2] == self[1,1] && self[1,1] == self[2,0])
        return true
    end
    return false
  end
  
  #error message and reassignment if spot is not empty
  def pos_error
    check = true
    while check
      puts "Spot occupied already, please select a new one."
      print "New row: " 
      row = gets.chomp.to_i
      print "New column: "
      column = gets.chomp.to_i
      pos = [row, column]
      check = false 
      return pos if empty?(*pos)
    end
  end
  
  #should re-get a position on the board
  def off_board_error
    pos = [10, 10]
    until valid_move?(*pos)
      puts "Please select valid location on the board."
      print "New row: " 
      row = gets.chomp.to_i
      print "New column: "
      column = gets.chomp.to_i
      pos = [row, column]
    end
    pos
  end
  
  #checks if the move is on the board/grid -- WORKING
  def valid_move?(*position)
   	[*position].all? {|coord| coord.between?(0, 2)}
  end

end