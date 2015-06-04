class Student
	attr_reader :courses, :first_name, :last_name
	
	def initialize(first_name, last_name)
		@first_name = first_name.capitalize
		@last_name = last_name.capitalize
		@courses = []
	end
	
	def name
		@first_name + " " + @last_name
	end
		
	def enroll(course)
		unless @courses.include?(course)
			error if @courses.any? {|classes| classes.conflicts_with?(course)} 
			@courses << course
			course.students << self
		end
	end
	
	def course_load
		dpt_credit = Hash.new(0)
		@courses.each {|course| dpt_credit[course.department] += course.credits}
		dpt_credit
	end
	
	def error
		raise "Class schedule conflicts! Choose new classes!"
	end
	
end

class Course
	attr_reader :course_name, :department, :credits, :students, :day, :block
	
	def initialize(course_name, department, credits, day = [], block)
		@course_name = course_name
		@department = department
		@credits = credits
		@day = day
		@block = block
		@students = []
	end
	
	def add_student(student)
		student.enroll(self)
	end
	
	def conflicts_with?(course)
		return true if block == course.block && (day & course.day).any?
		return false
	end
	
end
