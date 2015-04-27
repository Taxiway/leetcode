# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  max = 0
  i, j = 0, height.length - 1
  while i < j
    max = [max, (j - i) * [height[i], height[j]].min].max
    if height[i] < height[j]
      i += 1
    else
      j -= 1
    end
  end
  max
end

p max_area([1, 2, 3, 2, 1])
p max_area([1, 2, 3, 2, 3])
