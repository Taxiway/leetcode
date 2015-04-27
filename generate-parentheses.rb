# @param {Integer} n
# @return {String[]}

def gao(left, right, now, res)
  if left == 0 and right == 0
    res.push now
    return
  end

  if left > 0
    gao(left - 1, right, now + "(", res)
  end

  if right > left
    gao(left, right - 1, now + ")", res)
  end
end

def generate_parenthesis(n)
  res = []
  gao(n, n, "", res)
  res
end

p generate_parenthesis(0)
p generate_parenthesis(1)
p generate_parenthesis(2)
p generate_parenthesis(3)
