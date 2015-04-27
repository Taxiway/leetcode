# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  hash = Hash.new(0)
  best, curr = 0, 0
  p1, p2 = 0, -1
  while true
    while p2 + 1 < s.length
      p2 += 1
      hash[s[p2]] = hash[s[p2]] + 1
      curr += 1
      if hash[s[p2]] > 1
        break
      else
        best = [best, curr].max
      end
    end

    if p2 >= s.length - 1
      break
    end

    while hash[s[p2]] > 1
      hash[s[p1]] = hash[s[p1]] - 1
      p1 += 1
      curr -= 1
    end
  end
  best
end

len = lambda { |x| length_of_longest_substring(x) }
p len.call("abcd")
p len.call("bbbbb")
p len.call("a")
p len.call("")
p len.call("abcabcd")
