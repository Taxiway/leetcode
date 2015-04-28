# Definition for an interval.
class Interval
  attr_accessor :start, :end
  def initialize(s = 0, e = 0)
    @start = s
    @end = e
  end

  def to_s
    [@start, @end].to_s
  end
end

# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
  intervals.sort_by! do |i|
    i.start
  end
  ret = []
  return ret if intervals.length == 0
  start, stop = nil, nil
  intervals.each do |i|
    if start.nil?
      start = i.start
      stop = i.end
    elsif stop >= i.start
      stop = [stop, i.end].max
    else
      ret.push(Interval.new(start, stop))
      start = i.start
      stop = i.end
    end
  end
  ret.push(Interval.new(start, stop))
  ret
end

p merge([Interval.new(1, 3), Interval.new(15, 18), Interval.new(8, 10), Interval.new(2, 6)])
