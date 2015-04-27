# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
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


# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  # move forward n times
  p = head
  1.upto(n) do
    p = p.next
  end

  if p.nil?
    if n == 1
      return nil
    else
      return head.next
    end
  end

  h = head
  while not p.nil?
    p = p.next
    if p.nil?
      # remove h's next node
      h.next = h.next.next
      return head
    end
    h = h.next
  end
end

l1 = make_list(123)
print_list(l1)
l2 = make_list(4)
print_list(l2)
l3 = remove_nth_from_end(l1, 3)
print_list(l3)
l4 = remove_nth_from_end(l2, 1)
print_list(l4)
