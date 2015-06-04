def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(array=[])
  array.inject(0, :+)
end

def multiply(*num)
  num.inject(1, :*)
end

def power(base, exponent)
  base ** exponent
end

def factorial(num)
  case num
  when 0
    1
  else
    num * factorial(num - 1)
  end
end
