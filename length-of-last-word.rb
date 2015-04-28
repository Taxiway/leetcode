# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  a = s.split
  return 0 if a.length == 0
  a.last.length
end

p length_of_last_word("Hello World")
