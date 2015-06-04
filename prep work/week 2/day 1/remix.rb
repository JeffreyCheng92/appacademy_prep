#Make array of alcohols and shuffle them
# WORKS
def alcohol_list(drink_set = [])

	alcohols = drink_set.map { |drink| drink[0] } # TA: Like this!
	
	alcohols.shuffle
end

#Make array of mixers and shuffle them
# WORKS
def mixer_list(drink_set = [])
	mixers =  drink_set.map { |mixer| mixer[1] }
	
	mixers.shuffle
end

def shuffle_drinks(alcohols = [], mixers = [])
	remixed_drinks = []

	alcohols.each_index do |idx|
		remixed_drinks[idx] = [alcohols[idx], mixers[idx]]
	end

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
])