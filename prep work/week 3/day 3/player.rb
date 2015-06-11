class Player
	attr_reader :marker, :name, :player_num
	  
	def initialize(num)
		@player_num = num
	  @name = username
	end
	
	#allows player to choose where to place marker
	def shoot
  	user_shoot
	end
	
	private
	
	#obtains player's username
	def username
		puts "What is player #{player_num}'s name?"
		gets.chomp.capitalize
	end
	
	
	#helper class method to allow player to place marker
	def user_shoot
			print "#{name}, which row do you want to shoot: "
			row = gets.chomp.to_i
			print "#{name}, which column do you want to shoot: "
			column = gets.chomp.to_i
		  [row, column]
	end
	
end