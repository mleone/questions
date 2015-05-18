require_relative 'lib'

# For each node, make it point to the previous node, and then run the function
# again on the following node, with the current node as the previous node.
def reverse_list_mutation(list, previous=nil)
  next_node = list.next_node
  list.next_node = previous

  if next_node
    reverse_list_mutation(next_node, list)
  else
    list
  end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

LinkedList.print_values(node3)
puts "-------"
revlist = reverse_list_mutation(node3)
LinkedList.print_values(revlist)
