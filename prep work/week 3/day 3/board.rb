require 'colorize'

class Board
	attr_reader :grid
	
	def initialize
		@grid = Array.new(10) { Array.new(10, :l) }
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
  
	#checks if the position on the board is empty or not
  def empty?(*pos)
    self[*pos] == :l
  end

	def count
		counter = 0
		grid.each { |row| row.each {|position| counter += 1 if position == "X"} }
		counter
	end
	
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
  
  private
  
  #error message and reassignment if spot is not empty
  def pos_error
    check = false
    until check
      puts "Please select valid location on the board."
      print "New row: " 
      row = gets.chomp.to_i
      print "New column: "
      column = gets.chomp.to_i
      pos = [row, column]
    	if empty?(*pos) && valid_move?(*pos)
    		check = true
    		return pos
    	end
    end
  end
  
  #should re-get a position on the board
  def off_board_error
    pos = [99, 99]
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
   	[*position].all? {|coord| coord.between?(0, 9)}
  end



end