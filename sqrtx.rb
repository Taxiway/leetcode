# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  n = Math.sqrt(x).to_i
  if n * n == x
    return n
  end
  if (n + 1) * (n + 1) == x
    return n + 1
  end
  if (n - 1) * (n - 1) == x
    return n - 1
  end
  n
end

p my_sqrt(9)
p my_sqrt(0)
p my_sqrt(1)
p my_sqrt(256)
