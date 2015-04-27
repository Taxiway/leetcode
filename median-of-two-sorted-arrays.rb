# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}

def nth(a1, a2, n)
  l1, l2 = a1.length, a2.length
  down = (0, n - l2).max, up = (n, l1 - 1).min
  if too_small(a1[down], )
  end
end

def find_nth(a1, a2, n)
  res = nth(a1, a2, n)
  if res.nil?
    res = nth(a2, a1, n)
  end
  res
end

def find_median_sorted_arrays(nums1, nums2)
  l1, l2 = nums1.length, nums2.length
  l = l1 + l2
  if (l & 1) == 1
    find_nth(nums1, nums2, l / 2)
  else
    0.5 * (find_nth(nums1, nums2, l / 2 - 1) + find_nth(nums1, nums2, l / 2 - 1))
  end
end
