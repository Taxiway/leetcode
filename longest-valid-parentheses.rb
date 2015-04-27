# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  l = s.length
  best = 0
  dp = Array.new(l + 1) {Array.new(l + 1, false)}
  0.upto(l - 1) do |ind|
    dp[ind][ind] = true;
  end

  2.upto(l) do |len|
    0.upto(l - len) do |i|
      j = i + len - 1
      if s[i] == '(' and s[j] == ')' and dp[i + 1][j]
        dp[i][j + 1] = true
        best = len
      end
      (i + 1).upto(j - 1) do |k|
        if dp[i][k] and dp[k][j + 1]
          dp[i][j + 1] = true
          best = len
        end
      end
    end
  end

  best
end

p longest_valid_parentheses("")
p longest_valid_parentheses("()")
p longest_valid_parentheses("()()")
p longest_valid_parentheses("(())")
p longest_valid_parentheses("((())")
p longest_valid_parentheses(")()(")
p longest_valid_parentheses(")(()())()()()))))(((()))))(()())()((()()))()()(())()()((()(())))()()(((((()())(((()))()())((())(())(((((()(())())(()()))())((()(((((()()(())))))))()))()()((()(()((()()((()()())(")
