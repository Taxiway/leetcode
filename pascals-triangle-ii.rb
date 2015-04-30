# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  ret = []
  res = 1
  0.upto(row_index) do |i|
    ret.push(res)
    res *= (row_index - i)
    res /= (i + 1)
  end
  ret
end

1.upto(10) do |ind|
  p get_row(ind)
end
