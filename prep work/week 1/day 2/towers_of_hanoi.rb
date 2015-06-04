=begin
Write a Towers of Hanoi game.

Keep three arrays, which represents the piles of discs. Pick a representation of the discs to store in the arrays; maybe just a number representing their size. Don't worry too much about making the user interface pretty.

In a loop, prompt the user (using gets) and ask what pile to select a disc from, and where to put it.

After each move, check to see if they have succeeded in moving all the discs to the final pile. If so, they win!
=end

towers = [[4,3,2,1],[],[]]

until towers[2] == [4,3,2,1]
  p towers

  check_1 = true

  while check_1
    puts ("Which tower do you want to take from? ex. tower 1, tower 2, tower 3.")

    input1 = gets.chomp[-1].to_i - 1

    if input1 > 2 || input1 < 0
      puts "Please choose a valid tower.\n"
    elsif towers[input1].empty?
      puts "Please choose a nonempty tower.\n"
    else
      check_1 = false
    end

  end

  check_2 = true

  while check_2
    puts ("Where do you want to put tile #{towers[input1].last}? ex. tower 1, tower 2, tower 3")

    input2 = gets.chomp[-1].to_i - 1

    if input1 > 2 || input1 < 0
      puts "Please choose a valid tower.\n"
    elsif (towers[input2].empty?) || (towers[input1].last <= towers[input2].last)
      check_2 = false
    else
      puts "Invalid move, cannot put larger number on top of a smaller one.\n"
    end

  end

  towers[input2] << towers[input1].pop

end

puts "You have beaten the Towers of Hanoi!"
