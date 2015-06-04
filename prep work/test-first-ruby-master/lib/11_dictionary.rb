class Dictionary
  def initialize(entries = {})
    @entries = entries
  end

  def entries
    @entries
  end

  def keywords
    @entries.keys.sort
  end

  def add(word_def, define = nil)
    if word_def.is_a?(Hash)
      word_def.each do |word, define|
        @entries[word] = define
      end
    else
      @entries[word_def] = nil
    end
  end

  def include?(word)
    @entries.include?(word) ? true : false
  end

  def find(str)
    temp = {}
    @entries.each do |word, define|
      temp[word] = define if word.include?(str)
    end
    temp
  end

  def printable
    temp = @entries.sort.map do |key, value|
        ("[#{key}] \"#{value}\"")
      end
    temp.join("\n")
  end

end
