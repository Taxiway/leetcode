# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  l = nums.length
  0.upto(l - 1) do |ind|
    n = nums[ind]
    while n >= 1 and n <= l and nums[n - 1] != n
      nums[ind], nums[n - 1] = nums[n - 1], nums[ind]
      n = nums[ind]
    end
  end
  nums.each_with_index do |num, ind|
    if num != ind + 1
      return ind + 1
    end
  end
  return l + 1
end

p first_missing_positive([1, 2, 0])
p first_missing_positive([3, 4, -1, 1])
p first_missing_positive([1, 1, 1, 2])
p first_missing_positive([])
p first_missing_positive([-1])
