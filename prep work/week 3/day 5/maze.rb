# require 'byebug'
class Maze
	attr_reader :maze_array, :times_visited
	
	def initialize(text_file)
		maze_to_a(text_file)
		@times_visited = Hash.new(0)
	end
	
	def display
		maze_array.each { |line| p line }
	end

	def play
		@maze_array[find_start[0]][find_start[1]] = "X"
		win_loc = find_end
#		 debugger
		until won?(win_loc)
			display
			sleep 0.5
			puts "\e[H\e[2J"
			compass = surrounding
			north = compass[0] > 0 ? times_visited[north_spot] : 100
			south = compass[1] > 0 ? times_visited[south_spot] : 100
			east = compass[2] > 0 ? times_visited[east_spot] : 100
			west = compass[3] > 0 ?  times_visited[west_spot] : 100
			if north <= south && north <= east && north <= west
				up
			elsif south <= north && south <= east && south <= west
				down
			elsif east <= north && east <= south && east <= west
				right
			else
				left
			end
		end
		
		display
		puts "\n\n"
		winner
	end
	
	private
	
	def winner
		puts "You've beaten the maze!"
	end
	
	def north_spot
		im_at = current_loc
		return [ im_at[0] - 1, im_at[1] ]
	end
	
	def south_spot
		im_at = current_loc
		return [im_at[0] + 1, im_at[1] ]
	end
	
	def west_spot
		im_at = current_loc
		return [ im_at[0], im_at[1] - 1]
	end
	
	def east_spot
		im_at = current_loc
		return [ im_at[0], im_at[1] + 1 ]
	end
	
	def surrounding # [N S E W]
		im_at = current_loc
		compass = []
		maze_array[im_at[0] - 1][im_at[1]] != "*" ? compass << 1 : compass << -1
		maze_array[im_at[0] + 1][im_at[1]] != "*"	? compass << 1 : compass << -1
		maze_array[im_at[0]][im_at[1] + 1] != "*" ? compass << 1 : compass << -1
		maze_array[im_at[0]][im_at[1] - 1] != "*"	? compass << 1 : compass << -1
		compass
	end
	
	
	def won?(win_loc)
		return true if maze_array[win_loc[0]][win_loc[1]] != "E"
		return false
	end
		
	def up
		im_at = current_loc
		@times_visited[im_at] += 1
		@maze_array[im_at[0]][im_at[1]] = " "
		@maze_array[im_at[0] - 1][im_at[1]] = "X"
	end
	
	def down
		im_at = current_loc
		@times_visited[im_at] += 1
		@maze_array[im_at[0]][im_at[1]] = " "
		@maze_array[im_at[0] + 1][im_at[1]] = "X"
	end
	
	def left
		im_at = current_loc
		@times_visited[im_at] += 1
		@maze_array[im_at[0]][im_at[1]] = " "
		@maze_array[im_at[0]][im_at[1] - 1] = "X"
	end
	
	def right
		im_at = current_loc
		@times_visited[im_at] += 1
		@maze_array[im_at[0]][im_at[1]] = " "
		@maze_array[im_at[0]][im_at[1] + 1] = "X"
	end
		
	def find_start
		find_letter("S")
	end
	
	def find_end
		find_letter("E")
	end
	
	def current_loc
		find_letter("X")
	end
	
	def find_letter(str)
		maze_array.each_with_index do |element, row|
			element.each_with_index { |el, column| return [row, column] if el == str }
		end
	end
	
	def maze_to_a(file)
		maze = open_maze(file)
		@maze_array = Array.new(maze.length) { Array.new(maze[0].length) } 
		
		maze_array.each_with_index do |row, idx|
			row.each_with_index do |column, index|
				@maze_array[idx][index] = maze[idx][index]
			end
		end
	end
	
	def open_maze(file)
		maze = File.readlines(file)
		maze.map! { |lines| lines.chomp }
	end
	
end

test = Maze.new("hard_maze.txt")
test.play