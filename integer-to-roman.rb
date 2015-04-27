# @param {Integer} num
# @return {String}
def int_to_roman(num)
  marks = "IVXLCDM"
  nums = [1, 5, 10, 50, 100, 500, 1000]

  marks.reverse!
  nums.reverse!

  res = ""
  nums.each_with_index do |div, ind|
    if (ind & 1) == 1
      next
    end
    if num / div == 9
      res += marks[ind]
      res += marks[ind - 2]
    elsif num / div == 4
      res += marks[ind]
      res += marks[ind - 1]
    elsif num / div >= 5
      res += marks[ind - 1]
      res += marks[ind] * (num / div - 5)
    else
      res += marks[ind] * (num / div)
    end
    num %= div
  end
  res
end

puts int_to_roman(1)
puts int_to_roman(2)
puts int_to_roman(3)
puts int_to_roman(4)
puts int_to_roman(5)
puts int_to_roman(6)
puts int_to_roman(7)
puts int_to_roman(8)
puts int_to_roman(9)
puts int_to_roman(10)
puts int_to_roman(11)
puts int_to_roman(12)
puts int_to_roman(13)
puts int_to_roman(14)
puts int_to_roman(2751)
puts int_to_roman(448)
puts int_to_roman(369)


