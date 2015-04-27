# @param {String} digits
# @return {String[]}

def gao(digits, ind, now, hash, res)
  if ind == digits.length
    res.push now
    return
  end

  str = hash[digits[ind]]
  str.each_char do |char|
    gao(digits, ind + 1, now + char, hash, res)
  end
end

def letter_combinations(digits)
  ds = ["2", "3", "4", "5", "6", "7", "8", "9"]
  strs = ["abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
  res = []
  hash = Hash.new
  ds.zip(strs).each do |digit, str|
    hash[digit] = str
  end
  if digits.length == 0
    return []
  end
  gao(digits, 0, "", hash, res)
  res
end

p letter_combinations("23")
