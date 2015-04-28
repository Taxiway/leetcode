# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  if n <= 1
    return 1
  end
  a, b = 1, 1
  2.upto(n) do
    a, b = b, a + b
  end
  b
end
