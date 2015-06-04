def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str, times = 2)
  strings = str * times
  strings.gsub!(str[-1], strings[-1] << " ")
  strings.strip
end

def start_of_word(str, char = 1)
  str.slice(0..char-1)
end

def first_word(str)
  str[/\w+/]
end
  
def titleize(str)
  small_words = %w(and over the)
  
  words = str.split(" ")
  cap_words = words.map do |word|
    unless small_words.include?(word)
      word[0].upcase << word[1..-1]
    else
      word
    end
  end
  cap_words[0].capitalize!
  cap_words.join(" ")
end