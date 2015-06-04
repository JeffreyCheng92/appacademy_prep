def num_to_s(num, base)
  pow = 0
  dictionary = {10=>"A", 11=>"B", 12=>"C", 13=>"D", 14=>"E", 15=>"F"}
  return_string = ""
  while (num / (base ** pow)) > 0
    temp = ((num / (base ** pow)) % base)
    if temp < 10
      return_string << temp.to_s
    else
      return_string << dictionary[temp].to_s
    end
    pow += 1
  end

  return_string.reverse
end
