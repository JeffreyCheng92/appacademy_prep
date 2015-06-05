def superprint(str, options = {})
	defaults = {
		times: 1,
		upcase: false,
		reverse: false
	}
	
	options = defaults.merge(options)
	
	return_string = str
	return_string.upcase! if options[:upcase]
	return_string.reverse! if options[:reverse]
	
	p return_string * options[:times]
end


superprint("swag", upcase: true, times: 3) if __FILE__ == $PROGRAM_NAME
