# @param {Integer[]} height
# @return {Integer}
def trap(height)
  stack = []
  res = 0
  height.each do |h|
    #print h, " "
    if stack.length == 0 or h < stack.last[0]
      stack.push([h, 1])
    elsif h == stack.last[0]
      stack.last[1] += 1
    else
      lsum = 0
      lasth = -1
      while stack.length > 0 and stack.last[0] <= h
        lsum += stack.last[1]
        res += stack.last[1] * (h - stack.last[0])
        lasth = stack.last[0]
        stack.pop
      end
      if stack.length == 0
        res -= lsum * (h - lasth)
      end
      stack.push([h, lsum + 1])
    end
    #p res
    #p stack
  end
  res
end

p trap([0,1,0,2,1,0,1,3,2,1,2,1])
