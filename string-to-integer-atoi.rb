# @param {String} str
# @return {Integer}
def my_atoi(str)
  res = str.to_i
  if res >= (1 << 31)
    res = (1 << 31) - 1
  end
  if res < -(1 << 31)
    res = -(1 << 31)
  end
  res
end
