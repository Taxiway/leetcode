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

def delete_duplicates(head)
  newhead, p = nil, nil
  last = nil
  while !head.nil?
    if not ((!last.nil? and head.val == last.val) or
        (!head.next.nil? and head.val == head.next.val))
      if newhead.nil?
        newhead = p = head
      else
        p.next = head
        p = head
      end
    end
    last = head
    head = head.next
  end
  if !p.nil?
    p.next = nil
  end
  newhead
end

l = make_list(55432110)
print_list(delete_duplicates(l))
l = make_list(55)
print_list(delete_duplicates(l))
l = make_list(5432100)
print_list(delete_duplicates(l))
l = make_list(0)
print_list(delete_duplicates(l))
