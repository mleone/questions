require_relative 'lib'

# First, implement wrapper methods to safely return nil when the current
# node is nil or its next node is nil
def find_next_node(node)
  node ? node.next_node : nil
end

def two_nodes_away(node)
  if node && node.next_node
    node.next_node.next_node
  else
    nil
  end
end

# This implements the first part of Floyd's cycle-finding algorithm.
# We don't need to implement the second section, which finds the position
# of the first repetition, and we don't need to implement the third section,
# which finds the length of the shortest cycle. We just need to impement the first
# section, which has a "hare" pointer move at twice the speed of a "tortoise" pointer.
# If the cycle repeates, the two pointers will eventually have the same value.
#
# Assumes that if the nodes at two different pointers are the same, then the list is a
# cycle. We are comparing object IDs for equality, not node value, so if there
# two different node objects with a value of 3, they will not be seen as equal.
# They must be the exact same object!
def cycle_detect(list)
  tortoise = find_next_node(list)
  hare = two_nodes_away(list)

  # find the first time the circle repeats where the harie has also
  # moved exactly twice as far as the tortoise.
  while tortoise != hare
    tortoise = find_next_node(tortoise)
    hare = two_nodes_away(hare)
  end

  # If both tortoise and hare have a valid position at this point,
  # and are not nil, then a cycle was found.
  return !!(tortoise && hare)
end

# Repeating List. Should return true
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(42, node3)
node5 = LinkedListNode.new(43, node4)
node6 = LinkedListNode.new(44, node3)
node7 = LinkedListNode.new(47, node3)
node8 = LinkedListNode.new(57, node3)
node9 = LinkedListNode.new(58, node3)
node10 = LinkedListNode.new(22, node3)
node1.next_node = node8

puts cycle_detect(node10).inspect


# Non-repeating list that looks like a repeating list at first.
# Should return false.
node1 = LinkedListNode.new(22)
node2 = LinkedListNode.new(57, node1)
node3 = LinkedListNode.new(58, node2)
node4 = LinkedListNode.new(22, node3)
node5 = LinkedListNode.new(57, node4)
node6 = LinkedListNode.new(58, node3)
node7 = LinkedListNode.new(22, node3)
node8 = LinkedListNode.new(57, node3)
node9 = LinkedListNode.new(58, node3)
node10 = LinkedListNode.new(22, node3)

puts cycle_detect(node10).inspect
