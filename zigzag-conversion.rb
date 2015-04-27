# @param {String} s
# @param {Integer} nrows
# @returns {String}
def convert(s, nrows)
  if nrows == 1
    return s
  end

  len = s.length
  step = nrows * 2 - 2
  res = ""
  0.upto(nrows - 1) do |r|
    ind = r
    while ind < len
      res += s[ind]
      if r != 0 and r != nrows - 1
        ind2 = ind + step - r * 2
        res += s[ind2] if ind2 < len
      end
      ind += step
    end
  end
  res
end

puts convert("PAYPALISHIRING", 3)
puts convert("PAYPALISHIRING", 1)
puts convert("PAYPALISHIRING", 2)
puts convert("PA", 3)
puts convert("ABCDEFGHIJK", 4)
