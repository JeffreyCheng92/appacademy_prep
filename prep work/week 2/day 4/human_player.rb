class HumanPlayer
	attr_reader :marker, :name, :player_num
	  
	def initialize(num = nil)
		@player_num, @name, @marker = num, username, choose_marker
	end
	
	#allows player to choose where to place marker
	def move(board)
  	user_move
	end
	
	private
	
	#obtains player's username
	def username
		puts "What is player #{player_num}'s name?"
		gets.chomp.capitalize
	end
	
	#allows player to select marker
	def choose_marker
	  puts "What marker do you want to use?"
	  gets.chomp.intern
	end
	
	#helper class method to allow player to place marker
	def user_move
		print "Player #{player_num}, which row to place your marker on: "
  	row = gets.chomp.to_i
  	print "Player #{player_num}, which column to place your marker on: "
    column = gets.chomp.to_i
    
    [row, column]
	end
	
end
