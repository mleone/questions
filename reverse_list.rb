require_relative 'lib'

def reverse_list(list)
  new_list_stack = Stack.new

  while list
    new_list_stack.push(list)
    list = list.next_node
  end

  new_list_stack.data
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

LinkedList.print_values(node3)
puts "-------"
revlist = reverse_list(node3)
LinkedList.print_values(revlist)

