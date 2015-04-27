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

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def check_asending(l)
  if l.nil?
    return nil
  end
  while not l.next.nil?
    if l.val > l.next.val
      return false
    elsif l.val < l.next.val
      return true
    else
      l = l.next
    end
  end
  return nil
end

def merge_two_lists(l1, l2)
  asending = check_asending l1
  if asending.nil?
    asending = check_asending l2
    if asending.nil?
      asending = true
    end
  end

  p = head = nil
  while (not l1.nil?) and (not l2.nil?)
    if (asending and l1.val < l2.val) or ((not asending) and l1.val > l2.val)
      if p.nil?
        head = p = l1
      else
        p.next = l1
        p = l1
      end
      l1 = l1.next
    else
      if p.nil?
        head = p = l2
      else
        p.next = l2
        p = l2
      end
      l2 = l2.next
    end
  end

  while not l1.nil?
    if p.nil?
      head = p = l1
    else
      p.next = l1
      p = l1
    end
    l1 = l1.next
  end

  while not l2.nil?
    if p.nil?
      head = p = l2
    else
      p.next = l2
      p = l2
    end
    l2 = l2.next
  end

  head
end

l1 = make_list(951)
print_list(l1)
l2 = make_list(743)
print_list(l2)
l3 = merge_two_lists(l1, l2)
print_list(l3)

l1 = make_list(159)
print_list(l1)
l2 = make_list(3344557789)
print_list(l2)
l3 = merge_two_lists(l1, l2)
print_list(l3)

l1 = make_list(2)
print_list(l1)
l2 = make_list(222)
print_list(l2)
l3 = merge_two_lists(l1, l2)
print_list(l3)
