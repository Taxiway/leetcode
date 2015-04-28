# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def gaolast(nums, target)
  if nums[0] > target
    return -1
  end
  if nums.last <= target
    return nums.length - 1
  end
  down, up = 0, nums.length
  while down + 1 < up
    mid = (down + up) >> 1
    if nums[mid] <= target
      down = mid
    else
      up = mid
    end
  end
  down
end

def gaofirst(nums, target)
  if nums[0] >= target
    return 0
  end
  if nums.last < target
    return nums.length
  end
  down, up = 0, nums.length
  while down + 1 < up
    mid = (down + up) >> 1
    if nums[mid] < target
      down = mid
    else
      up = mid
    end
  end
  up
end

def search_range(nums, target)
  if nums.length == 0 or target < nums[0] or target > nums.last
    return [-1, -1]
  end
  down, up = gaolast(nums, target - 1), gaofirst(nums, target + 1)
  if down + 1 >= up
    return [-1, -1]
  else
    return [down + 1, up - 1]
  end
end


p search_range([5, 7, 7, 8, 8, 10], 8)
p search_range([5, 7, 7, 8, 8, 10], 7)
p search_range([5, 7, 7, 8, 8, 10], 6)
p search_range([5, 7, 7, 8, 8, 10], 5)
p search_range([5, 7, 7, 8, 8, 10], 4)
p search_range([5, 7, 7, 8, 8, 10], 9)
p search_range([5, 7, 7, 8, 8, 10], 10)
p search_range([5, 7, 7, 8, 8, 10], 11)
