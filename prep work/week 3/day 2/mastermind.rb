class Mastermind
	attr_reader :master
	
	def initialize
		@master = master_creator
	end
	
	def match_color(array)
		puts "#{color_checker(array)} correctly colored pegs in wrong position(s)."
	end
	
	def match_spot_and_color(array)
		puts "#{spot_color_checker(array)} pegs in correct position(s)."
	end
	
	def win?(array)
		master.zip(array).all? {|comp, player| comp == player} 
	end
	
	private
	
	def spot_color_checker(array)
		counter = 0
		master.each_with_index do |el, idx|
			counter += 1 if el == array[idx]
		end
		counter
	end
	
	def color_checker(array)
		temp = array.dup 
		
		master.each do |color|
			temp.each_with_index do |input, idx|
				if color == input
					temp[idx] = nil
					break
				end
			end
		end
		
		temp.select {|el| el == nil}.length - spot_color_checker(array)
	end
	
	def master_creator
		pegs = {0 => "R", 1 => "G", 2 => "B", 3 => "Y", 4 => "O", 5 => "P"}
		[pegs[rand(6)], pegs[rand(6)], pegs[rand(6)], pegs[rand(6)]]
	end
	
end