require "basic_queue/version"

module BasicQueue

# A basic first-in-first-out (FIFO) queue data structure.

# It supports the usual enqueue and dequeue operations, 
# along with methods for peeking at the first item, testing
# if the queue is empty and counting the number of items in the queue.

# This implementation uses a singly-linked list with a non-static
# nested class for linked-list nodes.

# All methods take constant time (Θ(1)). Hence, it is more performant than
# an Array, since Array#unshift takes linear time (Θ(n)).

# @author Robert Sedgewick
# @author Kevin Wayne
# @author Michael Imstepf
# @see http://algs4.cs.princeton.edu/13stacks
# @see http://algs4.cs.princeton.edu/13stacks/LinkedQueue.java.html
class Queue
  # Initializes the queue and sets variables.
  def initialize
    @length = 0
    @first = nil
    @last = nil
  end

  # Adds new item to the queue.
  # @param item [Item] the item to be enqueued
  # @return [Item] item
  def enq(item)
    # save previous old last node for use below
    old_last = @last
    
    # create new last node and update @last_item
    @last = Node.new(item, nil)    

    if empty? # set to nil
      @first = @last
    else # point 2nd last node to last node
      old_last.next_node = @last
    end
    
    @length += 1

    item
  end

  # Adds new item to the queue.
  # Alias method for #enq().
  # @param item [Item] the item to be enqueued
  # @return [Item] item
  def <<(item)
    enq(item)
  end

  # Removes and returns the item on this queue that was least recently added.
  # @return [Item] dequeued item
  def deq
    return nil if empty?
    
    # save previous first node for return value
    old_first = @first

    # update first node
    @first = @first.next_node
    @length -= 1

    # avoid loitering
    @last = nil if empty?

    old_first.item
  end

  # Returns next item in the queue.
  # @return [Item] item
  def peek
    empty? ? nil : @first.item
  end

  # Clears queue.
  # @return [Boolean] true
  def clear
    @length = 0
    @first = nil
    @last = nil
    true    
  end

  # Returns length of queue.
  # @return [Integer]
  def length
    @length
  end

  # Returns length of queue.
  # Alias method for #length.
  def size
    length
  end

  # Checks whether the queue is empty or not.
  # @return [Boolean]
  def empty?
    length == 0
  end
end

# In arrays and queues based on arrays, the enqueue method
# (Array#unshift) is often expensive since it needs to iterate through each
# array member and shift each member to the right, resulting in linear running time.
# We use a singly linked list instead.

# @author Robert Sedgewick
# @author Kevin Wayne
# @author Michael Imstepf
# @see http://algs4.cs.princeton.edu/13stacks/LinkedQueue.java.html
class Node
  attr_reader :item
  attr_accessor :next_node

  def initialize(item, next_node)
    @item = item
    @next_node = next_node
  end
end

end
