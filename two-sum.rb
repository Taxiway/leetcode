# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]} two integers in an array, ie: [index1, index2]
def two_sum(numbers, target)
  count = numbers.length
  arr = numbers.zip(1..count)
  arr.sort!

  p1, p2 = 0, count - 1
  while true
    sum = arr[p1][0] + arr[p2][0]
    if sum > target
      p2 -= 1
    elsif sum < target
      p1 += 1
    else
      break
    end
  end
  [arr[p1][1], arr[p2][1]].sort
end

#p two_sum([2, 7, 11, 15], 9)
#p two_sum([15, 7, 11, 2], 17)
