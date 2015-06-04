class String
  def titleize
    #regex reads: either beginning of string or whitespace followed by alpha
    self.gsub(/(\A|\s)[a-z]/) do |letter|
      letter.upcase!
    end

  end
end

class Book
  attr_accessor :title

  def title=(title)
    @title = title.titleize

    small_words = %w[In The And A An Of]
    words = @title.split(" ")

    words.each do |word|
      if small_words.include?(word)
        word.downcase!
      end
    end
    #words[0] = words[0].titleize
    words[0][0] = words[0][0].upcase
    @title = words.join(" ")

  end

end
