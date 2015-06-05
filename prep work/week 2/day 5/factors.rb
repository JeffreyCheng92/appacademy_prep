def factors(num)
	factor_num = []
	(1..num).each do |i|
		factor_num << i if num % i == 0
	end
	factor_num
end

puts factors(10) if __FILE__ == $PROGRAM_NAME