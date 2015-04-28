# @param {String} s
# @return {Boolean}
def is_number(s)
  s = s.lstrip.rstrip
  return false if s.length == 0
  return false if s.count(" ") > 0
  ecount = s.chars.count('e')
  return false if ecount > 1
  if ecount == 1
    parts = s.split('e')
    return false if parts.length != 2
    p1, p2 = parts
    return false if p2.count(".") > 0
    return is_number(p1) && is_number(p2)
  end
  if s[0] == '-' or s[0] == "+"
    s = s[1..-1]
  end
  dotcount = s.chars.count('.')
  return false if dotcount > 1
  s.gsub!(/\./, "")
  return false if s.length == 0
  s.each_char do |ch|
    if not(ch >= "0" and ch <= "9")
      return false
    end
  end
  true
end

p is_number("0")
p is_number(" 0.1 ")
p is_number("abc")
p is_number("1 a")
p is_number("2e10")
p is_number(" 0.2e.10")
