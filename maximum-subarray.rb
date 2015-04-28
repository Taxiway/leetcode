# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  best = nums[0]
  sum = 0
  nums.each do |num|
    if sum < 0
      sum = 0
    end
    sum += num
    best = [best, sum].max
  end
  best
end

p max_sub_array([-2,1,-3,4,-1,2,1,-5,4])
