# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  return "" if t == ""

  hash = Hash.new(0)
  hash2 = Hash.new(0)
  t.each_char do |ch|
    hash[ch] = hash[ch] - 1
    hash2[ch] = hash2[ch] - 1
  end

  best = nil
  i, j = 0, 0
  while j < s.length
    #p j
    #p hash
    #p hash2
    if hash.has_key?(s[j])
      hash[s[j]] = hash[s[j]] + 1
      if hash[s[j]] == 0
        hash2.delete s[j]
        if hash2.length == 0
          while true
            if hash.has_key?(s[i])
              hash[s[i]] = hash[s[i]] - 1
              if hash[s[i]] < 0
                hash2[s[i]] = -1
                this = s[i..j]
                #p i, j
                if best.nil? or this.length < best.length
                  best = this
                end
                #p best
                i += 1
                break
              end
            end
            i += 1
          end
        end
      end
    end
    j += 1
  end
  best = "" if best.nil?
  best
end

p min_window("ADOBECODEBANC", "ABC")
