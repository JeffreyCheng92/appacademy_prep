def dictionary_reader(file)
	words = File.readlines(file)
	words.map! {|word| word.chomp}
	words
end

def substrings(str)
	subwords = []
	real_words = dictionary_reader("dictionary.txt")
	characters = str.chars.to_a
	
	characters.each_with_index do |char, char_idx|
		length = 1
		while length < str.length + 1 - char_idx
		current_word = str.slice(char_idx, length) 
		subwords << current_word if real_words.include?(current_word)
		length += 1
		end
	end
	subwords
end

p substrings("cat")