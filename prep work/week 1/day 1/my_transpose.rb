def my_transpose(arrays)
  transposed_array = []

  arrays.each_with_index do |array,index|
    transposed_array[index] = []
  end

  arrays.each do |array|
    array.each_with_index do |num, index|
      transposed_array[index]. << num
    end
  end

  transposed_array

end
