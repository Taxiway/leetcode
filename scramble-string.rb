# @param {String} s1
# @param {String} s2
# @return {Boolean}
def is_scramble(s1, s2)
  return s1.chars.sort.join == s2.chars.sort.join
end

p is_scramble("rgtae", "great")
