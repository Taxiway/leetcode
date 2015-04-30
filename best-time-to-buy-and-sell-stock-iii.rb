# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  ret = 0
  l = prices.length
  dp = Array.new(l + 1) { Array.new(5, nil) }
  dp[0][0] = 0
  0.upto(l) do |day|
    0.upto(4) do |state|
      if !dp[day][state].nil?
        ret = [ret, dp[day][state]].max
        if day == l
          next
        end
        case
        when state == 0 || state == 2
          if dp[day + 1][state + 1].nil? or
              dp[day + 1][state + 1] < dp[day][state] - prices[day]
            dp[day + 1][state + 1] = dp[day][state] - prices[day]
          end
        when state == 1 || state == 3
          if dp[day + 1][state + 1].nil? or
              dp[day + 1][state + 1] < dp[day][state] + prices[day]
            dp[day + 1][state + 1] = dp[day][state] + prices[day]
          end
        end
        if dp[day + 1][state].nil? or dp[day + 1][state] < dp[day][state]
          dp[day + 1][state] = dp[day][state]
        end
      end
    end
  end
  ret
end

p max_profit([1])
p max_profit([1, 2])
p max_profit([1, 2, 3])
p max_profit([1, 2, 3, 4])
p max_profit([1, 2, 1, 4, 5])
p max_profit([1, 2, 3, 4, 1, 10])
