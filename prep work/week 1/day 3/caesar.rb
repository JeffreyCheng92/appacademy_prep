def caesar(str, offput)
  return_string = ""

  str.each_char do |letter|
    code = letter.ord + offput

    if code <= 122
      return_string << code.chr
    else
      return_string << (code - 26).chr
    end
  end
  return_string  

end
