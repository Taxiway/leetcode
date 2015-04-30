# @param {String} s
# @return {Integer}
def num_decodings(s)
  l = s.length
  return 0 if l == 0
  a = Array.new(l + 1)
  a[l] = 1
  (l - 1).downto(0) do |ind|
    num = s[ind].to_i
    if num == 0
      a[ind] = 0
    else
      a[ind] = a[ind + 1]
      if ind < l - 1
        if num == 1 or (num == 2 and s[ind + 1].to_i <= 6)
          a[ind] += a[ind + 2]
        end
      end
    end
  end
  a[0]
end

p num_decodings("0")
p num_decodings("12")
p num_decodings("27")
p num_decodings("26")
p num_decodings("220")
