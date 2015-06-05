load "student_course.rb"

class Registration
	attr_reader :job, :name
	
	def initialize
		@job = user
		@name = obtain_name
		@job == "student" ? student_actions : admin_actions
	end
	
	def user
		puts "Are you a student or an administator?"
		occupation = gets.chomp
		until occupation == "student" || occupation == "administator"
			puts "Please enter \"student\" or \"administator\""
			occupation = gets.chomp
		end
		occupation
	end
	
	def obtain_name
		confirmation = nil
		until confirmation == "Y"
			puts "What is your first name?"
			first_name = gets.chomp.capitalize
			puts "what is your last name?"
			last_name = gets.chomp.capitalize
			puts "Your name is #{first_name} #{last_name}. Is that right? (Y/N)"
			confirmation = gets.chomp.upcase
		end
		"#{first_name} #{last_name}"
	end

	def student_actions
		student_choice
		input = nil
		until input == "N"
			student_add
			puts "Would you like to add another course? (Y/N) "
			input = gets.chomp.upcase
		end
	end
	
	def admin_actions
		
	end
	
	private
	
	#Displays courses
	def display_classes
		classes = File.readline("classes.txt")
		classes.each {|course| puts course}
	end
	
	#Student can choose to add a course or quit
	def student_choice
		input = nil
		until input == "a" || input == "q"
				puts "Input \"a\" to add classes and \"q\" to quit."
				input = gets.chomp.downcase
		end
		if input == "q"
			puts "Thank you for using this computer!"
			Registration.new
		else
			display_classes
		end
	end
	
	#adding a course for the student
	def student_add
		name_array = name.split(" ")
		name = Student.new(name_array[0], name_array[1])
		puts "Enter course you would like to add."
		choice = gets.chomp.downcase
		name.enroll(choice) if choice.is_a?(Course)
	end
	
	
end

if __FILE__ == $PROGRAM_NAME
	genetics = Course.new("Genetics", "Biology", 4, [:mon, :wed, :fri], 1)
	calculus = Course.new("Calculus", "Math", 4, [:mon, :wed, :fri], 3)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
end