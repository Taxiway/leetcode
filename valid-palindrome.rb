# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  s.downcase!
  v = s.chars.find_all { |c| (c >= 'a' and c <= 'z') or (c >= '0' and c <= '9')}
  return v == v.reverse
end

p is_palindrome("")
p is_palindrome("race a car")
p is_palindrome("A man, a plan, a canal: Panama")

