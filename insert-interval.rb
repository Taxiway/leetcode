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

# @param {Interval[]} intervals
# @param {Interval} new_interval
# @return {Interval[]}
def insert(intervals, new_interval)
  intervals.push new_interval
  merge(intervals)
end
