def measure(n = 1, &block)
  start = Time.now
  n.times { block.call }

  if n > 1
    difference = Time.now - start
    average_time = difference / n
  else
    difference = Time.now - start
  end
  
end
