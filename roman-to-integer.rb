# @param {String} s
# @return {Integer}
def roman_to_int(s)
  marks = "IVXLCDM"
  nums = [1, 5, 10, 50, 100, 500, 1000]
  hash = Hash.new
  marks.each_char.zip(nums).each do |mark, num|
    hash[mark] = num
  end
  res = 0
  0.upto(s.length - 1) do |ind|
    if ind < s.length - 1 and hash[s[ind]] < hash[s[ind + 1]]
      res -= hash[s[ind]]
    else
      res += hash[s[ind]]
    end
  end
  res
end

p roman_to_int("I")
p roman_to_int("II")
p roman_to_int("III")
p roman_to_int("IV")
p roman_to_int("V")
p roman_to_int("VI")
p roman_to_int("VII")
p roman_to_int("VIII")
p roman_to_int("IX")
p roman_to_int("X")
p roman_to_int("XI")
p roman_to_int("XII")
p roman_to_int("XIII")
p roman_to_int("XIV")
p roman_to_int("MMDCCLI")
p roman_to_int("CDXLVIII")
p roman_to_int("CCCLXIX")
