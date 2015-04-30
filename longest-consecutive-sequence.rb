# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  m = Hash.new
  nums.each do |n|
    m[n] = 0
  end
  best = 0
  m.each do |k, v|
    next if v == 1
    m[k] = 1
    ct = 1
    n = k - 1
    while m.has_key? n
      ct += 1
      m[n] = 1
      n -= 1
    end
    n = k + 1
    while m.has_key? n
      ct += 1
      m[n] = 1
      n += 1
    end
    best = [best, ct].max
  end
  best
end

p longest_consecutive([100, 4, 200, 1, 3, 2])
