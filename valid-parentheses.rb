# @param {String} s
# @return {Boolean}
def is_valid(s)
  hash = Hash.new
  hash['}'] = '{'
  hash[']'] = '['
  hash[')'] = '('

  stack = []
  s.each_char do |char|
    if char == '[' or char == '{' or char == '('
      stack.push char
    else
      if stack.length == 0 or stack.last != hash[char]
        return false
      else
        stack.pop
      end
    end
  end

  return stack.length == 0
end

p is_valid("[]")
p is_valid("[")
p is_valid("[(])")
p is_valid("[({})]")
p is_valid("[]{{}([])}")
