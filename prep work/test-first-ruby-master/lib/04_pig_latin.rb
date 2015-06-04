def translate(str)
  vowels = %w[a e i o u]
  words = str.split(" ")
  
  
  translation = words.map do |word|
    if vowels.include?(word[0]) 
      word << "ay"
    elsif word.include?("qu")
      idx = word.index("u")
      word << word.slice!(0..idx) << "ay"
    else
      idx = word.index(/[aeiou]/)
      word << word.slice!(0...idx) << "ay"
    end
  end
  
  translation.join(" ")
end