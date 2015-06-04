class Temperature
  attr_accessor :f

  def initialize(degrees = {})
    @degrees = degrees
  end

  def in_fahrenheit
    if @degrees.include?(:f)
      @fahrenheit = @degrees[:f]
      @celsius = (@degrees[:f] - 32.0) * 5.0 / 9.0
    elsif @degrees.include?(:c)
      @celsius = @degrees[:c]
      @fahrenheit = @degrees[:c] * 9.0 / 5.0 + 32.0
    end
    @fahrenheit
  end

  def in_celsius
    if @degrees.include?(:f)
      @fahrenheit = @degrees[:f]
      @celsius = (@degrees[:f] - 32.0) * 5.0 / 9.0
    elsif @degrees.include?(:c)
      @celsius = @degrees[:c]
      @fahrenheit = @degrees[:c] * 9.0 / 5.0 + 32.0
    end
    @celsius
  end

  def self.from_celsius(temp)
    Temperature.new(:c => temp)
  end

  def self.from_fahrenheit(temp)
    Temperature.new(:f => temp)
  end

end

class Celsius < Temperature

  def initialize(temp, degrees = {})
    @degrees = degrees
    @degrees[:c] = temp
  end

  def in_celsius
    super
  end

end

class Fahrenheit < Temperature

  def initialize(temp, degrees = {})
    @degrees = degrees
    @degrees[:f] = temp
  end

  def in_fahrenheit
    super
  end

end
