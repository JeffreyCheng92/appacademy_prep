load "mastermind.rb"
load "player.rb"

class Game
	attr_reader :player, :comp
	
	def initialize
		@player = Player.new
		@comp = Mastermind.new
	end
	
	def start
		turn = 1
		
		until comp.win?(player.input)
			player.user_input
			comp.match_spot_and_color(player.input)
			comp.match_color(player.input)
			turn += 1
		end
		
		winner(turn)
	end
	
	private
	
	def winner(turn)
		puts "You've beaten the game in #{turn} turns!"
	end
	
end