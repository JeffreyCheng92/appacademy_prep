class Array
  def two_sum
    temp = []
    self.each_with_index do |num, idx|
      new_array = self[(idx + 1)..-1]
        if new_array.include?(-num)
          temp << [idx, self.index(-num)]
        else
          next
        end
    end
    temp
  end
end
