class FileShuffle
	attr_reader :file
	
	def initialize
		print "What file do you want to shuffle: "
		@file = gets.chomp
		real_life?(file) ? write("#{file}-shuffled.txt") : (puts "File not found")
	end

	def write(filename)
		File.open("#{filename}", "w") do |f|
			shuffle_lines.each {|line| f.puts line}
		end
	end
	
	def shuffle_lines
		lines = File.readlines("#{file}.txt")
		lines.shuffle!
	end
	
	def real_life?(file)
		File.exists?("#{file}.txt")
	end
	
end
	
FileShuffle.new if __FILE__ == $PROGRAM_NAME