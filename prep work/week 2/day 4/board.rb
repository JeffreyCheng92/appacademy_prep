class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }
  end
  
  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
  end
  
  def display
    grid.each { |line| p line }
  end
  
  #determines if there is a winner present on the board
  def won?
    won_checker
  end
  
  #displays message to the winner
  def winner(player)
    puts "Congratulations #{player}! You win!"
  end
  
  #checks if the position on the board is empty or not
  def empty?(*pos)
    return true if self[*pos].nil?
    return false
  end
  
  #places mark on chosen position 
  def place_mark(*pos, mark)
    check = true
    while check
    
      if empty?(*pos)
        self[*pos] = mark
        check = false
      else
        pos = pos_error
      end
      
    end
  end

  #added after mike li left
  def empty_position
    empty_locations = []
    grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        empty_locations << [row_idx, col_idx] if grid[row_idx][col_idx] == nil
      end
    end
    empty_locations
  end
  
  private
  
  #winning conditions
  def won_checker
    if (self[0,0] != nil && self[0,0] == self[0,1] && self[0,1] == self[0,2]) || 
       (self[1,0] != nil && self[1,0] == self[1,1] && self[1,1] == self[1,2]) ||
       (self[2,0] != nil && self[2,0] == self[2,1] && self[2,1] == self[2,2]) ||
       (self[0,0] != nil && self[0,0] == self[1,0] && self[1,0] == self[2,0]) ||
       (self[0,1] != nil && self[0,1] == self[1,1] && self[1,1] == self[2,1]) ||
       (self[0,2] != nil && self[0,2] == self[1,2] && self[1,2] == self[2,2]) ||
       (self[0,0] != nil && self[0,0] == self[1,1] && self[1,1] == self[2,2]) ||
       (self[0,2] != nil && self[0,2] == self[1,1] && self[1,1] == self[2,0])
        return true
    end
    return false
  end
  
  def pos_error
    puts "Square is occupied, please repick a square"
    print "New row: "
    row = gets.chomp.to_i
    print "New column: "
    column = gets.chomp.to_i
    [row, column]
  end
end