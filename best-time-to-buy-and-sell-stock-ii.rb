# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  ret = 0
  l = prices.length
  hold, holdp = 0, 0
  0.upto(l - 1) do |ind|
    today = prices[ind]
    if hold != 0 and today > holdp
      ret += (today - holdp)
      hold = 0
    end
    if hold == 0 and ind < l - 1 and prices[ind + 1] > today
      hold = 1
      holdp = today
    end
  end
  ret
end
