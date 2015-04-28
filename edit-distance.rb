# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  l1, l2 = word1.length, word2.length
  mem = Array.new(l1 + 1) { Array.new(l2 + 1, 0) }
  0.upto(l1) do |i|
    0.upto(l2) do |j|
      next if i == 0 and j == 0
      mem[i][j] = l1 + l2 + 1
      if i > 0
        mem[i][j] = [mem[i][j], mem[i - 1][j] + 1].min
      end
      if j > 0
        mem[i][j] = [mem[i][j], mem[i][j - 1] + 1].min
      end
      if i > 0 and j > 0
        extra = 1
        if word1[i - 1] == word2[j - 1]
          extra = 0
        end
        mem[i][j] = [mem[i][j], mem[i - 1][j - 1] + extra].min
      end
    end
  end
  mem[l1][l2]
end

p min_distance("word1", "word2")
p min_distance("abcd", "ef")
