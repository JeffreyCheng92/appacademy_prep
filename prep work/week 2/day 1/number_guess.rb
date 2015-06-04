def computer_num
	number = rand(100) + 1
end

def guess(num)
	winning_num = computer_num
	count = 1
		
	while num != winning_num
	count += 1
		comparing(num, winning_num)
		puts "Guess again!"
		num = gets.to_i
	end
	
	puts "You\'e won in #{count} turns!"
end

def comparing(num, computer_num)
	
	if num < computer_num
		print "Too low! "
	elsif num > computer_num
		print "Too high! "
	end
	
end

	
=begin
Write a number guessing game. 
The computer should choose a number between 1 and 100. 
It should prompt the user for guesses.
Each time, it will prompt the user for a guess; it will return too high or too low. 
It should track the number of guesses the player took.
=end