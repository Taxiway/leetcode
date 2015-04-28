# @param {String} path
# @return {String}
def simplify_path(path)
  p = path.split('/')
  a = []
  p.each do |pp|
    if pp == "." or pp == ""
      next
    elsif pp == ".."
      a.pop
    else
      a.push pp
    end
  end
  if a.length == 0
    "/"
  else
    a.inject("") { |sum, n| sum + "/" + n }
  end
end

p simplify_path("/home/")
p simplify_path("/a/./b/../../c/")
p simplify_path("/../")
p simplify_path("/home//foo/")
