class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def time_string
    hours = @seconds / 3600
    minutes = (@seconds % 3600) / 60
    seconds = @seconds % 60

    @time_string = "#{sprintf("%02i:%02i:%02i", hours, minutes, seconds)}"

  end

end
