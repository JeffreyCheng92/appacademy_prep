class Player
	attr_reader :input
	
	def initialize
		@input = Array.new
	end
	
	def user_input
		puts "Peg colors: Red, Green, Blue, Yellow, Orange, Purple."
		
		1.upto(4) do |num|
			input[num - 1] = obtain_color(num)
		end
		
	end
			
	private
	
	def obtain_color(num)
		print "What color would you like to choose for spot #{num}: "
		choice = gets.chomp[0].upcase
		
		until %w(R G B Y O P).include?(choice)
			color_error
			choice = gets.chomp[0].upcase
		end
		
		choice
	end
	
	def color_error
		puts "Choose a valid color (red, green, blue, yellow, orange, or purple)."
	end
end