def alcohol_list(drink_set = [])
	drink_set.map { |drink| drink[0] }
end

def mixer_list(drink_set = [])
	mixers =  drink_set.map { |mixer| mixer[1] }
	new_mixers = mixers.shuffle

	until mixers.zip(new_mixers).all? { |left, right| left != right }
		new_mixers = mixers.shuffle
	end
	
	new_mixers
end

def shuffle_drinks(alcohols = [], mixers = [])
	remixed_drinks = []

	alcohols.each_index {|idx| remixed_drinks[idx] = [alcohols[idx], mixers[idx]]}
 
	p remixed_drinks
end

def remix(drink_set = [])
	alcohols = alcohol_list(drink_set)
	mixers = mixer_list(drink_set)
	
	shuffle_drinks(alcohols, mixers)
end

remix([
  ["rum", "coke"],
  ["gin", "tonic"],
  ["scotch", "soda"]
]) if __FILE__ == $PROGRAM_NAME