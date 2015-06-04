class Array
  def my_each
    idx = 0
    while idx < self.length
      yield self[idx]
      idx += 1
    end
    self
  end
end
