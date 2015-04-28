# @param {Integer[]} height
# @return {Integer}
def largest_rectangle_area(height)
  height.push(0)
  arr = []
  best = 0
  height.each do |h|
    if arr.length == 0 || h > arr.last[0]
      arr.push([h, 1])
    else
      sumlen = 0
      while arr.length > 0 and arr.last[0] >= h
        lasth, len = arr.pop
        sumlen += len
        best = [best, sumlen * lasth].max
      end
      arr.push([h, 1 + sumlen])
    end
  end
  best
end

p largest_rectangle_area([2,1,5,6,2,3])
p largest_rectangle_area([1, 2, 3, 4, 5])
p largest_rectangle_area([5, 4, 3, 2, 1])
