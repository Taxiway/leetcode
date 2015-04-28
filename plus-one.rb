# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  digits.reverse!
  digits.each_with_index do |d, ind|
    if d != 9
      digits[ind] += 1
      return digits.reverse
    else
      digits[ind] = 0
    end
  end
  digits.push(1)
  digits.reverse
end

p plus_one([0])
p plus_one([2])
p plus_one([9])
p plus_one([1, 9])
p plus_one([9, 9, 9])
