# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  if n < 0
    return 1.0 / my_pow(x, -n)
  end
  if n == 0
    return 1.0
  end
  i = 1
  res = 1.0
  while i <= n
    if (n & i) != 0
      res *= x
    end
    x *= x
    i <<= 1
  end
  res
end

p my_pow(1.0, 5)
p my_pow(2.0, 5)
p my_pow(2.0, -5)
p my_pow(-2.0, 4)
p my_pow(-2.0, 5)
p my_pow(2.0, 0)
