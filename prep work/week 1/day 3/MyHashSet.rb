class MyHashSet
  def initialize(store={})
    @store = store
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store.has_key?(el)
  end

  def delete(el)
    if @store.include?(el)
      @store.delete(el)
      true
    else
      false
    end
  end

  def to_a
    @store.key.to_a
  end

  def union(set2)
    new_set = MyHashSet.new
    self.to_a.each do |element|
      new_set.insert(element)
    end
    set2.to_a.each do |element|
      new_set.insert(element)
    end
    new_set
  end

  def intersect(set2)
    new_set = MyHashSet.new

    self.to_a.each do |element|
      new_set.insert(element) if set2.include?(element)
    end

    new_set
  end

  def minus(set2)
    new_set =MyHashSet.new

    self.to_a.each do |element|
      new_set.insert(element) unless set2.include?(element)
    end

    new_set

  end



end
