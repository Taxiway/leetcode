# @param {Integer} n
# @return {Integer[]}

def gao(a)
  l = a.length
  (l - 1).downto(0) do |ind|
    a.push(a[ind] + l)
  end
  a
end

def gray_code(n)
  a = [0]
  1.upto(n) do
    a = gao(a)
  end
  a
end

p gray_code(0)
p gray_code(1)
p gray_code(2)
p gray_code(3)
p gray_code(4)
