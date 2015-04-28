# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  a.reverse!
  b.reverse!
  p a, b
  carry = 0
  i = 0
  res = ""
  while i < a.length and i < b.length
    sum = a[i].to_i + b[i].to_i + carry
    if (sum & 1) != 0
      res += "1"
    else
      res += "0"
    end
    carry = sum / 2
    i += 1
  end
  while i < a.length
    sum = a[i].to_i + carry
    if (sum & 1) != 0
      res += "1"
    else
      res += "0"
    end
    carry = sum / 2
    i += 1
  end
  while i < b.length
    sum = b[i].to_i + carry
    if (sum & 1) != 0
      res += "1"
    else
      res += "0"
    end
    carry = sum / 2
    i += 1
  end
  if carry == 1
    res += "1"
  end
  res.reverse
end

p add_binary("11", "1")
