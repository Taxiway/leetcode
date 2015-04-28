# @param {String[]} words
# @param {Integer} max_width
# @return {String[]}

def calmin(words)
  return words.length - 1 + words.inject(0) { |sum, w| sum + w.length }
end

def gao2(words, w)
  res = ""
  words.each_with_index do |word, ind|
    if ind != 0
      res += " "
    end
    res += word
  end
  res += " " * (w - res.length)
  res
end

def gao(words, w)
  if words.length == 1
    return gao2(words, w)
  end

  ngap = words.length - 1
  space = w - words.inject(0) { |sum, w| sum + w.length }
  every = space / ngap
  leave = space % ngap

  res = ""
  words.each_with_index do |word, ind|
    if ind != 0
      if ind <= leave
        res += " " * (every + 1)
      else
        res += " " * every
      end
    end
    res += word
  end
  res
end

def full_justify(words, max_width)
  cache = []
  res = []
  words.each do |word|
    cache.push word
    if calmin(cache) > max_width
      cache.pop
      res.push(gao(cache, max_width))
      cache = [word]
    end
  end
  res.push(gao2(cache, max_width))
  res
end

p full_justify(["This", "is", "an", "example", "of", "text", "justification."], 16)
