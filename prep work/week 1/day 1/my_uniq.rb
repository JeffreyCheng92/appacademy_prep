class Array
  def my_uniq
    unique_array = []
    self.each do |num|
      unique_array << num if !unique_array.include?(num)
    end
    unique_array.sort
  end
end
