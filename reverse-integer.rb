# @param {Integer} x
# @return {Integer}
def reverse(x)
  negative = x < 0
  x = -x if x < 0
  return 0 if x == 0
  res = ""
  while x > 0
    res += (x % 10).to_s
    x /= 10
  end
  res_int = res.to_i
  res_int = -res_int if negative
  res_int = 0 if res_int >= (1 << 31) or res_int < -(1 << 31)
  res_int
end

p reverse(123)
p reverse(-123)
p reverse(1)
p reverse(0)
p reverse(9876543210987654321)
p reverse(10)
p reverse(1534236469)
