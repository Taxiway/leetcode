def print_list l
  while not l.nil?
    print l.val
    l = l.next
  end
  puts ""
end

def make_list digits
  l = p = ListNode.new(0)
  while digits > 0
    p.val = digits % 10
    digits /= 10
    if digits > 0
      p.next = ListNode.new(0)
      p = p.next
    end
  end
  l
end

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def count(head)
  ret = 0
  tail = nil
  while !head.nil?
    tail = head
    ret += 1
    head = head.next
  end
  [tail, ret]
end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return head if head.nil?
  tail, n = count(head)
  k %= n
  return head if k == 0
  k = n - k - 1
  node = head
  1.upto(k) do
    node = node.next
  end
  newhead = node.next
  node.next = nil
  tail.next = head
  newhead
end

l = make_list(12345)
print_list l
print_list(rotate_right(l, 0))

l = make_list(12345)
print_list l
print_list(rotate_right(l, 1))

l = make_list(12345)
print_list l
print_list(rotate_right(l, 2))

l = make_list(12345)
print_list l
print_list(rotate_right(l, 3))

l = make_list(12345)
print_list l
print_list(rotate_right(l, 4))

l = make_list(12345)
print_list l
print_list(rotate_right(l, 5))

l = make_list(12345)
print_list l
print_list(rotate_right(l, 6))
