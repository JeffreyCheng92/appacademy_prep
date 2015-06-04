class Array
  def sum
    self.inject(0) do |total, num|
      total + num
    end
  end

  def square
    self.map do |x|
      x ** 2
    end
  end

  def square!
    self.map! { |x| x**2}
  end




end
