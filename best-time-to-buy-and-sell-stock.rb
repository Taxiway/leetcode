# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  prices.reverse!
  best = 0
  max = prices[0]
  prices.each do |p|
    if p > max
      max = p
    else
      best = [best, max - p].max
    end
  end
  best
end
