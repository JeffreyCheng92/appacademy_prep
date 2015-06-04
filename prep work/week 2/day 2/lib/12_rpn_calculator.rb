class RPNCalculator
  def initialize
  	@numbers = []
  end
  
  def push(num); @numbers << num; end
    
  def value; @numbers.last; end
    
  def plus
    error
    @numbers << @numbers.pop + @numbers.pop
  end
  
  def minus
    error
    @numbers << @numbers.delete_at(-2) - @numbers.pop
  end
  
  def divide
    error
    @numbers << @numbers.delete_at(-2).to_f / @numbers.pop
  end
  
  def times
    error
    @numbers << @numbers.pop.to_f * @numbers.pop
  end
  
  def tokens(str)
    math_array = str.split(" ")
    math_array.map {|el| el =~ /\d+/ ? el.to_i : el.intern}
  end
  
  def evaluate(str)
    tokens(str).each do |el|
      case el
      when :+ ; plus
      when :- ; minus
      when :* ; times
      when :/ ; divide
      else    ; push(el)
      end
    end
    value
  end
  
  def loader
    ARGV.length == 1 ? file_loader : user_input
  end
  
  private
  
  def file_loader
    command = File.read(ARGV.shift)
    puts evaluate(command)
  end
  
  def user_input
    puts "Enter numbers to calculate"
    string = ""
    
    string << gets.chomp + " " until string.include?("  ")
    
    puts "The answer is #{evaluate(string.strip)}"
  end
    
  def error
    raise "calculator is empty" if @numbers.length < 2
  end
end

RPNCalculator.new.loader if __FILE__ == $PROGRAM_NAME
