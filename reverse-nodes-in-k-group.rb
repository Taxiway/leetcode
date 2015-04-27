# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def kormore(head, k)
  1.upto(k) do
    if head.nil?
      return false
    end
    head = head.next
  end
  return true
end

def gaok(head, k)
  if not kormore(head, k)
    return [head, nil, nil]
  end
  thistail = p = head

  if k == 1
    nexthead = p.next
    p.next = nil
    return [p, p, nexthead]
  end

  p1, p2, p3 = p, p.next, nil
  p1.next = nil
  2.upto(k) do
    p3 = p2.next
    p2.next = p1
    p1, p2 = p2, p3
  end
  #print_list p1
  [p1, thistail, p2]
end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  newhead, lasttail = nil
  p = head
  while not p.nil?
    thishead, thistail, p = gaok(p, k)
    if newhead.nil?
      newhead = thishead
    else
      lasttail.next = thishead
    end
    lasttail = thistail
  end
  newhead
end

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

l1 = make_list(1234567890)
print_list(l1)
l2 = reverse_k_group(l1, 3)
print_list(l2)
l1 = make_list(1234567890)
l2 = reverse_k_group(l1, 2)
print_list(l2)
l1 = make_list(1234567890)
l2 = reverse_k_group(l1, 1)
print_list(l2)
