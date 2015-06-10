class Dictionary
  attr_reader :entries
  
  def initialize(entries = {})
    @entries = entries
  end
  
  def keywords
    entries.keys.sort
  end
  
  def add(word)
    if word.is_a?(Hash)
      word.each {|key, value| entries[key] = value}
    else
      entries[word] = nil
    end
  end
  
  def include?(word)
    entries.keys.include?(word)
  end
    
  def find(str)
    return_hash = {}
    entries.each do |key, value|
      return_hash[key] = value if key.include?(str)
    end
    return_hash
  end
  
  def printable
    return_string = entries.sort.map do |key, value|
      "[#{key}] \"#{value}\""
    end
    return_string.join("\n")
  end
  
end
