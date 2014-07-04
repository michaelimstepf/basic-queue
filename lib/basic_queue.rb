require "basic_queue/version"

module BasicQueue

# A basic queue with enqueue and dequeue methods.

# This class takes a different approach by reversing the array.
# Enqueue adds a new element to the end of the array, which runs at constant time.
# Dequeue deletes the first non-nil value of the array, also running at constant time.

# To save memory, once the array has a set of leading values with nil entries
# the array is copied into a new array without the leading empty values.
# This process can be turned on or off and the threshold can be set in the initialize method.

# @author Robert Sedgewick
# @author Kevin Wayne
# @author Michael Imstepf
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
