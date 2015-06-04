def comp_choice
	comp_selection = rand(3) + 1
end

def win(user_choice)
	puts "#{user_choice.capitalize}, Win!"
end

def lose(user_choice)
	puts "#{user_choice.capitalize}, Lose!"
end

def draw(user_choice)
	puts "#{user_choice.capitalize}, Draw!"
end

def compare(user_choice, comp_choice)
	selection = {:scissors => 1, :rock => 2, :paper => 3}
	
	if selection[user_choice] == comp_choice
		draw(user_choice)
	elsif selection[user_choice] == 3 && comp_choice == 1
		lose(user_choice)
	elsif selection[user_choice] == 1 && comp_choice == 3
		win(user_choice)
	elsif selection[user_choice] > comp_choice
		win(user_choice)
	else
		lose(user_choice)
	end
end

def rps(user_choice)
	user_choice = user_choice.to_sym
	
	compare(user_choice, comp_choice)
end

	


