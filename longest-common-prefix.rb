# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.length == 0
  res = ""
  limit = strs.collect { |x| x.length }.min
  0.upto(limit - 1) do |ind|
    isok = true
    1.upto(strs.length - 1) do |i|
      if strs[i][ind] != strs[0][ind]
        isok = false
        break
      end
    end
    if isok
      res += strs[0][ind]
    else
      break
    end
  end
  res
end

p longest_common_prefix(["a"])
p longest_common_prefix(["ab", "ab"])
p longest_common_prefix(["abd", "abc"])
p longest_common_prefix(["abd", "abc", "ab"])
p longest_common_prefix(["abd", "abc", "ab", "c"])
