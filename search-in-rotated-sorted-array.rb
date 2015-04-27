# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}

def find(nums, target)
  if nums.nil? or target < nums[0] or target > nums.last
    return -1
  end
  return 0 if target == nums[0]
  return nums.length - 1 if target == nums.last
  down, up = 0, nums.length - 1
  while down + 1 < up
    mid = (down + up) >> 1
    if nums[mid] == target
      return mid
    else
      if nums[mid] < target
        down = mid
      else
        up = mid
      end
    end
  end
  return -1
end

def search(nums, target)
  if nums.length <= 2
    nums.each_with_index do |num, index|
      if num == target
        return index
      end
    end
    return -1
  end

  reversed = false
  result = -1
  if nums[0] > nums.last
    nums.reverse!
    reversed = !reversed
  end
  if nums[1] > nums[0] and not(nums[1] > nums.last)
    #sorted
    #p "sorted"
    result = find(nums, target)
  else
    # two part
    nums.reverse!
    reversed = !reversed
    down, up = 0, nums.length - 1
    while down + 1 < up
      mid = (down + up) >> 1
      if nums[mid] > nums[0]
        down = mid
      else
        up = mid
      end
    end
    #p nums
    #p nums[0..down]
    result = find(nums[0..down], target)
    if result == -1
      result = find(nums[up..-1], target)
      #p "r", up, nums[up..-1]
      if result != -1
        result += (down + 1)
      end
    end
  end
  return result if result == -1
  if reversed
    result = nums.length - result - 1
  end
  result
end

p search([], 1)
p search([1], 1)
p search([1], 2)
p search([1, 2], 1)
p search([1, 2], 3)
p search([1, 2, 3], 3)
p search([1, 2, 3], 4)
p search([3, 2, 1], 3)
p search([3, 2, 1], 4)
p search([3, 1, 2], 3)
p search([3, 1, 2], 4)
p search([1, 3, 2], 3)
p search([1, 3, 2], 4)
p search([1, 4, 3, 2], 4)
p search([1, 4, 3, 2], 5)
p search([4, 3, 2, 1], 4)
p search([4, 3, 2, 1], 5)
p search([1, 3, 5], 3)
