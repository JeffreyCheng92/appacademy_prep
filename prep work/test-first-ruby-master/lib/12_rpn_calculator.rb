class RPNCalculator
  def initialize(array = [])
    @array = array
  end

  def push(num)
    @array << num
  end

  def plus
    if @array.length < 2
      raise "calculator is empty"
    end
    @array.push(@array.pop + @array.pop)
  end

  def minus
    if @array.length < 2
      raise "calculator is empty"
    end
    @array.push(@array.delete_at(-2) - @array.pop)
  end

  def divide
    if @array.length < 2
      raise "calculator is empty"
    end
    @array.push(@array.delete_at(-2).to_f / @array.pop.to_f)
  end

  def times
    if @array.length < 2
      raise "calculator is empty"
    end
    @array.push(@array.pop.to_f * @array.pop.to_f)
  end

  def value
    @array[-1]
  end

  def tokens(str)
    array = str.split(" ")
    array.map! do |x|
      if ( x == "+" || x == "-" || x == "*" || x == "/")
        x.intern
      else
        x.to_i
      end
    end
    array
  end

  def evaluate(str)
    tokens(str).each do |x|
      case x
      when :+
        self.plus
      when :-
        self.minus
      when :*
        self.times
      when :/
        self.divide
      else
        self.push(x)
      end
    end
    self.value
  end

end
