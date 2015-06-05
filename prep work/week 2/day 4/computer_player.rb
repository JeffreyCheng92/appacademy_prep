load "board.rb"

class ComputerPlayer
  attr_reader :marker, :name
  
	def initialize
	    @name, @marker = "Siri", choose_marker
	end
	
	#computer player places down marker
	def move(board)
  	random_move(board)
	end
	
	private
	
	#user chooses marker for computer player
  def choose_marker
    puts "What marker do you want the computer player to use?"
    gets.chomp.intern
  end
  
  #computer player places marker at random spot unless able to win
  def random_move(board)
    empty_spot = winning_move(board)
    empty_spot ||= board.empty_position.sample
  end
  
  #find the winning move if there is one
  def winning_move(board)
    winning_spot = nil
    
    board.empty_position.each do |spot|
      board.place_mark(*spot, marker)
      winning_spot = spot if board.won?
      board[*spot] = nil
    end
    
    winning_spot
  end
  
end


