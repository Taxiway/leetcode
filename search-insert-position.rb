# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  return 0 if nums.length == 0 or target <= nums[0]
  return nums.length if target > nums.last
  return nums.length - 1 if target == nums.last
  down, up = 0, nums.length - 1
  while down + 1 < up
    mid = (down + up) >> 1
    if nums[mid] == target
      return mid
    elsif nums[mid] < target
      down = mid
    else
      up = mid
    end
  end
  return up
end

p search_insert([1, 3, 5, 6], 5)
p search_insert([1, 3, 5, 6], 2)
p search_insert([1, 3, 5, 6], 7)
p search_insert([1, 3, 5, 6], 0)
p search_insert([1, 3, 5, 6], 1)
p search_insert([1, 3, 5, 6], 6)
