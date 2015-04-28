# @param {String[]} strs
# @return {String[]}
def anagrams(strs)
  hash = Hash.new(0)
  strs.each do |str|
    s = str.chars.sort.join
    hash[s] = hash[s] + 1
  end
  res = []
  strs.each do |str|
    s = str.chars.sort.join
    if hash[s] >= 2
      res.push str
    end
  end
  res
end

p anagrams(["abc", "def", "df", "df", "gge", "egg", "fed", "fed", "a", "bb", "bb"])
