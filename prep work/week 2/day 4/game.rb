load "human_player.rb"
load "computer_player.rb"
load "board.rb"

class Game
  attr_reader :player1, :player2, :board
  
  def initialize
    @player1, @player2, @board = nil, nil, Board.new
  end
  
  #start playing TicTacToe
  def play
    set_up_players(how_many_players)
    gameplay
  end
    
  private
  
  #loop for continuous gameplay until there is a winner/tie
  def gameplay
    turn = 1
    
    until board.won?
      puts "TURN: #{turn}"
      board.display
      board.place_mark(*player1.move(board), player1.marker)
      congratulations(player1)
      next if board.won?
      if turn > 4
        board.tie
        break
      end
      board.display
      board.place_mark(*player2.move(board), player2.marker)
      congratulations(player2)
      turn += 1
    end
  end
  
  #prompts user for number of players
  def how_many_players
    puts "How many human players are there?"
    num = gets.chomp.to_i
    until num <= 2 && num >= 0
      puts "Please choose a number between 0-2"
      num = gets.chomp.to_i
    end
    num
  end
  
  #sets up human players and/or computer players  
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
  
  #congratulates the winner of the game
  def congratulations(player)
    if board.won?
        puts "\n"
        board.display 
        board.winner(player.name)
    end
  end
  
end