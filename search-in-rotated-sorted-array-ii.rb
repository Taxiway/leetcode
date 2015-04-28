# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}
def search(nums, target)
  return !nums.find_index(target).nil?
end

p search([1,1,3], 1)
p search([1,1,3], 2)
