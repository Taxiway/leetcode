# @param {String} s
# @return {String[]}

def gao(a)
  a.inject("") do |sum, n|
    if sum.length > 0
      sum + "." + n
    else
      sum + n
    end
  end
end

def dfs(s, ind, left, cur, ret)
  if left == 0
    if ind == s.length
      ret.push(gao(cur))
    end
    return
  end
  ind.upto(ind + 2) do |ind2|
    if ind2 >= s.length
      return
    end
    this = s[ind..ind2]
    if this.to_i <= 255 and not(this.length != 1 and this[0] == "0")
      cur.push(this)
      dfs(s, ind2 + 1, left - 1, cur, ret)
      cur.pop
    end
  end
end

def restore_ip_addresses(s)
  ret = []
  cur = []
  dfs(s, 0, 4, cur, ret)
  ret
end

p restore_ip_addresses("25525511135")
p restore_ip_addresses("010010")
