load 'computer.rb'
load 'player.rb'

class Hangman
	attr_reader :guessing_player, :checking_player, :secret_word, :guessed_word
	
  def initialize
     @guessing_player = nil
     @checking_player = nil
     @secret_word = []
     @guessed_word = []
  end
  
  def play
    set_up_players(how_many_players)
    @secret_word = checking_player.pick_secret_word.split("")
		@guessed_word = Array.new(secret_word.length) { "_" }
		
		if guessing_player.class == Computer
			guessing_player.limit_words(guessing_player.receive_secret_length)
			guessing_player.parse_word_bank
		end
		
		until guessed_word == secret_word
			display_word
			letter = guessing_player.get_input
			modify(guess(letter), letter)
		end
  	
  	winner_winner
  end
  
  private
  
  def winner_winner
  	puts "Correct! The word was #{@secret_word.join}!"
  	puts "You've beaten the game #{guessing_player.name}!"
  end
  
  def guess(letter)
  	indices = []
  	secret_word.each_with_index { |char, idx| indices << idx if char == letter }
    indices
  end
  
  def modify(indices, letter)
  	indices.each { |idx| @guessed_word[idx] = letter }
  end
  
  def display_word
    puts guessed_word.join
  end
  
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
    	puts "Do you want to guess or check?"
    	reply = gets.chomp
    	if reply == "guess"
	      @guessing_player = Player.new(1)
	      @checking_player = Computer.new
	    else
	     	@guessing_player = Computer.new
	      @checking_player = Player.new(1)
      end
    when 2
      @guessing_player = Player.new(1)
      @checking_player = Player.new(2)
    end
  end
  
  
end
