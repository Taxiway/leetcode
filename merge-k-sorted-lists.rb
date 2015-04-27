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

class Heap
  def initialize(max)
    @max = max
    @arr = [[-1, -1]]
  end

  def isok(child, p)
    return not((child[0] > p[0] and @max) or (child[0] < p[0] and (not @max)))
  end

  def should_up(ind)
    if ind == 1
      return false
    end
    child, p = @arr[ind], @arr[ind / 2]
    return not(isok(child, p))
  end

  def push(num, i)
    @arr.push([num, i])
    ind = @arr.length - 1
    while should_up ind
      @arr[ind], @arr[ind / 2] = @arr[ind / 2], @arr[ind]
      ind /= 2
    end
  end

  def empty?
    return @arr.length <= 1
  end

  def mark_down
    ind = 1
    while true
      p1, p2 = ind * 2, ind * 2 + 1
      if p1 >= @arr.length
        return
      elsif p2 >= @arr.length
        if should_up(p1)
          @arr[ind], @arr[p1] = @arr[p1], @arr[ind]
          ind = p1
        else
          return
        end
      else
        if should_up(p1) and should_up(p2)
          if (@arr[p1][0] > @arr[p2][0] and @max) or
              (@arr[p1][0] < @arr[p2][0] and (not @max))
            @arr[ind], @arr[p1] = @arr[p1], @arr[ind]
            ind = p1
          else
            @arr[ind], @arr[p2] = @arr[p2], @arr[ind]
            ind = p2
          end
        elsif should_up(p1)
          @arr[ind], @arr[p1] = @arr[p1], @arr[ind]
          ind = p1
        elsif should_up(p2)
          @arr[ind], @arr[p2] = @arr[p2], @arr[ind]
          ind = p2
        else
          return
        end
      end
    end
  end

  def pop
    ret = @arr[1]
    @arr[1] = @arr.last
    @arr.pop
    if not empty?
      mark_down
    end
    ret
  end
end

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


# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  asending = nil
  lists.each do |list|
    asending = check_asending list
    if not asending.nil?
      break
    end
  end

  if asending.nil?
    asending = true
  end

  h = Heap.new(not(asending))
  lists.each_with_index do |list, ind|
    if not list.nil?
      h.push(list.val, ind)
    end
  end

  p = head = nil

  while not h.empty?
    _, ind = h.pop
    if p.nil?
      head = p = lists[ind]
    else
      p.next = lists[ind]
      p = p.next
    end
    lists[ind] = lists[ind].next
    if not lists[ind].nil?
      h.push(lists[ind].val, ind)
    end
  end

  head
end

h = Heap.new(false)
h.push(1, 0)
h.push(3, 0)
h.push(2, 0)
h.push(9, 0)
h.push(7, 0)
h.push(3, 0)
p h.pop
p h.pop
p h.pop
p h.pop
p h.pop
p h.pop

l1 = make_list(951)
print_list(l1)
l2 = make_list(743)
print_list(l2)
l3 = merge_k_lists([l1, l2])
print_list(l3)

l1 = make_list(159)
print_list(l1)
l2 = make_list(347)
print_list(l2)
l3 = merge_k_lists([l1, l2])
print_list(l3)

l1 = make_list(159)
print_list(l1)
l2 = make_list(3344557789)
print_list(l2)
l3 = merge_k_lists([l1, l2])
print_list(l3)

l1 = make_list(2)
print_list(l1)
l2 = make_list(222)
print_list(l2)
l3 = merge_k_lists([l1, l2])
print_list(l3)
