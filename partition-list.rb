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

# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
  h1 = h2 = p1 = p2 = nil
  while !head.nil?
    if head.val < x
      if h1.nil?
        h1 = p1 = head
      else
        p1.next = head
        p1 = head
      end
    else
      if h2.nil?
        h2 = p2 = head
      else
        p2.next = head
        p2 = head
      end
    end
    head = head.next
  end
  if !p1.nil?
    p1.next = nil
  end
  if !p2.nil?
    p2.next = nil
  end
  h = p = nil
  [[h1, p1], [h2, p2]].each do |hh, pp|
    if !hh.nil?
      if h.nil?
        h = hh
        p = pp
      else
        p.next = hh
        p = pp
      end
    end
  end
  if !p.nil?
    p.next = nil
  end
  h
end

l1 = make_list(252341)
print_list(partition(l1, 3))
