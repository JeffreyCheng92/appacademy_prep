def stock_picker(array)
  buy_date = 0
  sell_date = 0
  difference = 0

  array.each_with_index do |buy_price, buy_day|
    idx = buy_day + 1

    while idx < array.length

      current_difference = array[idx] - buy_price

      if current_difference > difference
        difference = current_difference
        sell_date = idx
        buy_date = buy_day
      end

      idx += 1

    end
    
  end

  [buy_date, sell_date]

end
