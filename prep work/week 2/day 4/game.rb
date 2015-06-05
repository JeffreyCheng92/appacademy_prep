load "human_player.rb"
load "computer_player.rb"
load "board.rb"

class Game
  attr_reader :player1, :player2, :board
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new 
  end
  
  def play
    set_up_players(how_many_players)
    gameplay
  end
    
  private
  
  def gameplay
    turn = 1
    
    until board.won?
    
      puts "TURN: #{turn}"
      board.display
      board.place_mark(*player1.move(board), player1.marker)
      board.winner(player1.name) if board.won?
      next if board.won?
      board.display
      board.place_mark(*player2.move(board), player2.marker)
      
      if board.won?
        puts "\n"
        board.display 
        board.winner(player2.name)
      end
      
      turn += 1
    end
  end
  
  def how_many_players
    puts "How many human players are there?"
    num = gets.chomp.to_i
    until num <= 2 && num >= 0
      puts "Please choose a number between 0-2"
      num = gets.chomp.to_i
    end
    num
  end
    
  def set_up_players(num)
    case num
    when 1
      @player1 = HumanPlayer.new(1)
      @player2 = ComputerPlayer.new
    when 2
      @player1 = HumanPlayer.new(1)
      @player2 = HumanPlayer.new(2)
    else
      @player1 = ComputerPlayer.new
      @player2 = ComputerPlayer.new
    end
  end

end