def prime?(num, primes = [])
	primes.each do |prime|
		return false if num % prime == 0
	end
	true
end

def prime(number)
	primes = []
	current_num = 2

	while current_num < number 
		primes << current_num if prime?(current_num, primes)
		current_num += 1
	end
	
	primes.join(",")
end

File.open(ARGV[0]).each_line do |line|
  puts prime(line.to_i) if line.strip.length > 0
end