# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_permutation(n, k)
  fact = [1]
  1.upto(10) do |i|
    fact.push(fact.last * i)
  end
  res = ""
  a = (1..n).to_a
  1.upto(n) do |i|
    a.each_with_index do |num, ind|
      left = a.length - 1
      if k <= fact[left]
        a.delete_at ind
        res += num.to_s
        break
      else
        k -= fact[left]
      end
    end
  end
  res
end

p get_permutation(3, 1)
p get_permutation(3, 2)
p get_permutation(3, 3)
p get_permutation(3, 4)
p get_permutation(3, 5)
p get_permutation(3, 6)
