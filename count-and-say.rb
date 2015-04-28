# @param {Integer} n
# @return {String}

def gao(s)
  res = ""
  last = ""
  count = 0
  s.each_char do |ch|
    if ch == last
      count += 1
    else
      if last != ""
        res += count.to_s
        res += last
      end
      count = 1
      last = ch
    end
  end
  res += count.to_s
  res += last
  res
end

def count_and_say(n)
  s = "1"
  2.upto(n) do
    s = gao(s)
  end
  s
end

1.upto(10) do |ind|
  p count_and_say(ind)
end
