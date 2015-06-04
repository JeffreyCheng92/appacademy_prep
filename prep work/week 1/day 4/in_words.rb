class Fixnum
    def translate_11_to_19 (num)
        index = %w( eleven twelve thirteen fourteen fifteen sixteen 
        seventeen eighteen nineteen )
        index[num - 11]
    end
    
    def translate_1_to_10 (num)
      index = %w( one two three four five six seven eight nine ten)
      index[num - 1]
    end
    
    def translate_20_to_90(num)
      index = %w(twenty thirty forty fifty sixty seventy eighty ninety)
      index[num - 2]
    end
    
    def remainder(num, base, string)
      result = []
      result << (num/base).translate
      result << string
      result << (num % base).translate unless num % base == 0
      result
    end
    
    def translate
      
      num = self
      result = []
      
      if num >= 1_000_000_000_000
        result << remainder(num, 1_000_000_000_000, "trillion")
      elsif num >= 1_000_000_000
        result << remainder(num, 1_000_000_000, "billion")
      elsif num >= 1_000_000
        result << remainder(num, 1000000, "million")
      elsif num >= 1_000
        result << remainder(num, 1000, "thousand")
      elsif num >= 100
        result << remainder(num, 100, "hundred")
      end
      
      if num.between? 20, 99
        result << translate_20_to_90(num/10)
        num = num % 10
      end
      
      if num.between? 11, 19
        result << translate_11_to_19(num)
      end
      
      if num.between? 1, 10
        result << translate_1_to_10(num)
      end
      
      result.join(" ")
    end
      
    def in_words
      if self == 0
        return "zero"
      end
      self.translate
    end
end