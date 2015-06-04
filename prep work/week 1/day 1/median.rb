def median(array)
  if array.length % 2 == 1
    array[array.length/2]
  else
    sum = array[array.length/2 - 1] + array[array.length/2]
    sum / 2.0
  end
end
