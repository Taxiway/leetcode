# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  return head if head.nil? or head.next.nil?
  newhead = head.next

  p, p1, p2 = nil, head, head.next
  while not p1.nil?
    if p2.nil? # one node left
      p.next = p1
      break
    end

    # two nodes
    p3, p4 = p2.next, nil
    if not p3.nil?
      p4 = p3.next
    end

    if not p.nil?
      p.next = p2
    end
    p2.next = p1
    p1.next = nil

    p = p1

    p1, p2 = p3, p4
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

l1 = make_list(123456789)
print_list(l1)
l2 = swap_pairs(l1)
print_list(l2)

l1 = make_list(12345678)
print_list(l1)
l2 = swap_pairs(l1)
print_list(l2)

l1 = make_list(1)
print_list(l1)
l2 = swap_pairs(l1)
print_list(l2)

l1 = make_list(12)
print_list(l1)
l2 = swap_pairs(l1)
print_list(l2)
