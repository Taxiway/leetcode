# @param {Integer} m
# @param {Integer} n
# @return {Integer}

def C(n, m, mem)
  return mem[n][m] if mem[n][m] != -1
  if m == n or m == 0
    mem[n][m] = 1
  else
    mem[n][m] = C(n - 1, m - 1, mem) + C(n - 1, m, mem)
  end
  mem[n][m]
end

def unique_paths(m, n)
  mem = Array.new(110) { Array.new(110, -1) }
  C(m + n - 2, m - 1, mem)
end

p unique_paths(2, 2)
p unique_paths(7, 3)
