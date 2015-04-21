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

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  l3 = nil
  p1, p2, p3 = l1, l2, l3
  carry = 0
  while (not p1.nil?) and (not p2.nil?)
    sum = p1.val + p2.val + carry
    sum, carry = (sum % 10), sum / 10
    p4 = ListNode.new(sum)
    if p3.nil?
      l3 = p3 = p4
    else
      p3.next = p4
      p3 = p4
    end
    p1, p2 = p1.next, p2.next
  end

  while not p1.nil?
    sum = p1.val + carry
    sum, carry = (sum % 10), sum / 10
    p4 = ListNode.new(sum)
    if p3.nil?
      l3 = p3 = p4
    else
      p3.next = p4
      p3 = p4
    end
    p1 = p1.next
  end

  while not p2.nil?
    sum = p2.val + carry
    sum, carry = (sum % 10), sum / 10
    p4 = ListNode.new(sum)
    if p3.nil?
      l3 = p3 = p4
    else
      p3.next = p4
      p3 = p4
    end
    p2 = p2.next
  end

  if carry == 1
    p4 = ListNode.new(1)
    p3.next = p4
  end

  l3
end

l1 = make_list(999)
print_list(l1)
l2 = make_list(666)
print_list(l2)
l3 = add_two_numbers(l1, l2)
print_list(l3)
