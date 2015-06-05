def bubble_sort(array = [])
	sorted = false
	until sorted
		sorted = true
		array.each_index do |idx|
			next if idx == array.length - 1
			
			if array[idx] > array[idx + 1]
				array[idx], array[idx + 1] = array[idx + 1], array[idx]
				sorted = false
			end
			
		end
	end
	
	array
end

if __FILE__ == $PROGRAM_NAME
	p bubble_sort([3, 2, 1]) 
	p bubble_sort([10,15,19,66,55])
end