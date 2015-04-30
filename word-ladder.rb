require 'set'

def cango(w1, w2)
  a1, a2 = w1.chars, w2.chars
  s = a1.zip(a2).inject(0) do |sum, pair|
    if pair[0] == pair[1]
      sum
    else
      sum + 1
    end
  end
  s <= 1
end

# @param {String} begin_word
# @param {String} end_word
# @param {Set<String>} word_dict
# @return {Integer}
def ladder_length(begin_word, end_word, word_dict)
  if begin_word == end_word
    return 0
  end
  queue = Queue.new
  queue.push [begin_word, 0]

  while !queue.empty?
    word, len = queue.pop
    if cango(word, end_word)
      return len + 1
    end
    new_word_dict = Set.new
    word_dict.each do |w|
      if cango(word, w)
        queue.push [w, len + 1]
      else
        new_word_dict.add(w)
      end
    end
    word_dict = new_word_dict
  end
  0
end

s = Set.new
s.add("acc")
p ladder_length("abc", "ccc", s)
p ladder_length("abc", "ccc", Set.new)
