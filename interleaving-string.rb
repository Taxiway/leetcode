# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
  l1, l2, l3 = s1.length, s2.length, s3.length
  return false if l1 + l2 != l3

  dp = Array.new(l1 + 1) { Array.new(l2 + 1, false) }
  dp[0][0] = true
  0.upto(l3 - 1) do |sum|
    0.upto([l1, sum].min) do |i|
      j = sum - i
      if dp[i][j]
        if i < l1 and s1[i] == s3[sum]
          dp[i + 1][j] = true
        end
        if j < l2 and s2[j] == s3[sum]
          dp[i][j + 1] = true
        end
      end
    end
  end
  dp[l1][l2]
end

p is_interleave("aabcc", "dbbca", "aadbbcbcac")
p is_interleave("aabcc", "dbbca", "aadbbbaccc")
