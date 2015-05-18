require_relative 'lib'

# FYI this does seem like a weird implementation because the Stack implementation
# uses a linked list as the internal data structure, and this piece of code uses
# both a stack and a linked list (two levels of abstraction)
def reverse_list(list)
  new_list_stack = Stack.new

  while list
    new_list_stack.push(list)
    list = list.next_node
  end

  # Once everything is pushed onto the stack just pop the top element
  # which is a linked list pointing to the rest of the elements.
  new_list_stack.pop
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

LinkedList.print_values(node3)
puts "-------"
revlist = reverse_list(node3)
LinkedList.print_values(revlist)

