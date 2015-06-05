load "board.rb"

class ComputerPlayer
  attr_reader :marker, :name
  
	def initialize
	    @name = "Siri"
	    @marker = choose_marker
	end
	
	def move(board)
  	random_move(board)
	end
	
	private
	
  def choose_marker
    puts "What marker do you want to use for the computer player?"
    gets.chomp.intern
  end
  
  def random_move(board)
    empty_spot = board.empty_position.sample
    board.empty_position.each do |spot|
      board.place_mark(*spot, marker)
#      board[*spot] = marker
      empty_spot = spot if board.won?
      board[*spot] = nil
    end
    empty_spot
  end
  
=begin	
  def random_move(board)
    row, column =  rand(3), rand(3)
    row, column =  rand(3), rand(3) until board.empty?(row, column)
    loc = winning_move(board)
    puts loc
    loc ||= [row, column]
  end

  def empty_pos(board)
    empty_loc = []
    board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        empty_loc << [row_idx, col_idx] if board.grid[row_idx][col_idx] == nil
      end
    end
    empty_loc
  end
  

  def winning_move(board)
    empty_locations = empty_pos(board)
    empty_locations.each do |loc|
      temp_board = board
      temp_board.place_mark(*loc, marker)
      return loc if temp_board.won?
    end
    return "poop"
  end


  def winning_move(board)
    puts "winning_move"
    empty_locations = empty_pos(board)
    p empty_locations.to_s
    loc = nil
    idx = 0
    while idx < empty_locations.length
      puts "about to place mark for #{idx}"
      #puts "#{empty_locations[idx].to_s}"
      board.place_mark(*empty_locations[idx], :o)
      puts "ran for idx: #{idx}"
      loc = empty_locations[idx] if board.won?
      board.grid[empty_locations[idx][0], empty_locations[idx][1]] = nil
      puts "replaced with nil #{idx}"
      idx += 1
    end
    loc
  end
=end
end


