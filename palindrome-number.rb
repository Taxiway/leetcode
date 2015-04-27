# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  res = x.to_s
  res == res.reverse
end

p is_palindrome(123)
p is_palindrome(121)
p is_palindrome(11)
p is_palindrome(-121)
p is_palindrome(0)
