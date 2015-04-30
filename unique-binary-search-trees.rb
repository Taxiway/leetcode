# @param {Integer} n
# @return {Integer}
def num_trees(n)
  mem = Array.new(n + 1)
  mem[0] = 1
  1.upto(n) do |num|
    mem[num] = 0
    0.upto(num - 1) do |left|
      right = num - left - 1
      mem[num] += mem[left] * mem[right]
    end
  end
  mem[n]
end

0.upto(10) do |n|
  p num_trees(n)
end
