def reverser(&block)
  words = yield.split
  words.each do |x|
    x.reverse!
  end
  words.join(" ")
end

def adder(num = 1, &block)
  yield + num
end

def repeater(n=1, &block)
  n.times { yield }
end
