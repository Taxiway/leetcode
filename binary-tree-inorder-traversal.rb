# Definition for a binary tree node
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def gao(root, ret)
  if !root.nil?
    gao(root.left, ret)
    ret.push(root.val)
    gao(root.right, ret)
  end
end

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  ret = []
  gao(root, ret)
  ret
end
