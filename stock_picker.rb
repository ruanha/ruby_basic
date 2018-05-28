def stock_picker prices
  ''' 
  input: an array of integers
  return: 
  '''
  best = 0
  best_index = [nil, nil]
  prices[0...-1].each_with_index do |buy, idx|
    prices[idx..-1].each_with_index do |sell, sell_idx|
      profit = sell-buy
      if (profit > best)
        best = profit
        best_index = [idx, idx+sell_idx]
      end
    end
  end
  puts best_index
end

stock_picker [17,3,6,9,15,8,6,1,10]