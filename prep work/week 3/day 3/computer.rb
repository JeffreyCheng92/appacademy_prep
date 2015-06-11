class Computer
	
	def initialize
		
	end
	
	def ship_locations(board)
		locations = []
		5.times do |x|
			pos = [rand(10), rand(10)]
			until board.empty?(*pos)
				pos = [rand(10), rand(10)]
			end
			
			locations << pos
		end
		
		locations
	end
	
end