class HumanPlayer
	attr_reader :marker, :name, :player_num
	  
	def initialize(num = nil)
		@player_num = num
	  @name = username
	  @marker = choose_marker
	end
	
	def move(board)
  	user_move
	end
	
	private
	
	def username
		puts "What is player #{player_num}'s name?"
		name = gets.chomp.capitalize
	end
	
	def choose_marker
    puts "What marker do you want to use?"
    marker = gets.chomp.intern
  end
	
	def user_move
		puts "Player #{player_num}, which row would you like to place your marker?"
  	row = gets.chomp.to_i
  		
  	puts "Player #{player_num}, which column would you like the place it on?"
    column = gets.chomp.to_i
    
    [row, column]
	end
	
end
