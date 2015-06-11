load "board.rb"
load "ship.rb"
load "player.rb"
load "computer.rb"
require 'colorize'

class Battleship
	attr_reader :player, :board, :ship_locations
	
	
	def initialize
#		@ship = Ship.new
	end
	
	def play
#		set_up_players(how_many_players)
		@player = Player.new(1)
		@board = Board.new
		@ship_locations = Computer.new.ship_locations(board)
		p ship_locations
		
		until won?
			board.display
			targets_left
			target = player.shoot
			if ship_locations.include?(target)
				board.place_mark(*target, :X)
			else
				board.place_mark(*target, :O)
			end
		end
		
		winner_winner
	end

	private
	
	def winner_winner
		puts "You've beaten the game #{player.name}!"
	end
	
	def won?
		board[*ship_locations[0]] == :X &&
		board[*ship_locations[1]] == :X &&
		board[*ship_locations[2]] == :X &&
		board[*ship_locations[3]] == :X &&
		board[*ship_locations[4]] == :X
	end	
	
	def targets_left
		puts "There are #{5 - board.count} targets remaining. GET THEM!"
	end	
	
=begin	


	
	#prompts user for number of players
  def how_many_players
    puts "How many human players are there?"
    num = gets.chomp.to_i
    until num.between?(1, 2)
      puts "Please choose a number between 1-2"
      num = gets.chomp.to_i
    end
    num
  end
  
  #sets up human players and/or computer players  
  def set_up_players(num)
    case num
    when 1
      @player1 = Player.new(1)
      @board1 = Board.new
      @player2 = Computer.new
      @board2 = Board.new
    when 2
      @player1 = Player.new(1)
      @board1 = Board.new
      @player2 = Player.new(2)
      @board2 = Board.new
    end
  end
=end

end
