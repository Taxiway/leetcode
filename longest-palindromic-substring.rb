# @param {String} s
# @return {String}
def longest_palindrome(s)
  best = ""
  l = s.length
  0.upto(l - 1) do |ind|
    i = j = ind
    while i >= 0 && j < l
      if s[i] != s[j]
        break
      end
      i, j = i - 1, j + 1
    end
    if j - i - 1 > best.length
      best = s[i + 1 .. j - 1]
    end

    if ind != l - 1 and s[ind] == s[ind + 1]
      i, j = ind, ind + 1
      while i >= 0 && j < l
        if s[i] != s[j]
          break
        end
        i, j = i - 1, j + 1
      end
      if j - i - 1 > best.length
        best = s[i + 1 .. j - 1]
      end
    end
  end

  best
end

p longest_palindrome("1")
p longest_palindrome("11")
p longest_palindrome("121")
p longest_palindrome("1221")
p longest_palindrome("1332")
p longest_palindrome("133132")
