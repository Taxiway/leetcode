# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  best = 0
  nums.each_with_index do |num, ind|
    if ind > best
      return false
    end
    best = [best, ind + nums[ind]].max
  end
  return true
end

p can_jump([2,3,1,1,4])
p can_jump([3,2,1,0,4])
