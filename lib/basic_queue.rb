require "basic_queue/version"

module BasicQueue

# A basic queue with enqueue and dequeue methods.

# In arrays and queues based on arrays, the enqueue method
# (Array#unshift) is often expensive since it needs to iterate through each
# array member and shift each member to the right, resulting in linear running time.

# This class takes a different approach by reversing the array.
# Enqueue adds a new element to the end of the array, which runs at constant time.
# Dequeue deletes the first non-nil value of the array, also running at constant time.

# To save memory, once the array has 1,000 leading values with nil entries
# the array is copied into a new array without the leading empty values.

# @author Michael Imstepf
class Queue
  # Initializes the queue and sets variables.
  def initialize
    @array = []
    @first_index = 0
  end

  # Adds new item to the queue.
  # @param [Item] item
  # @return [Item] item
  def enq(item)
    @array << item
  end

  # Adds new item to the queue.
  # Alias method for #enq().
  # @param [Item] item
  # @return [Item] item
  def <<(item)
    enq(item)
  end

  # Adds new item to the queue.
  # Alias method for #enq().
  # @return [Boolean] true
  def deq
    @array[@first_index] = nil
    @first_index += 1
    collect_garbage if @first_index > 1000
    true
  end

  # Clears queue.
  # @return [Boolean] true
  def clear
    @array = []
    @first_index = 0
    true    
  end

  # Counts length of queue.
  # @return [Integer]
  def length
    @array.length - @first_index
  end

  private

  # Truncates array.
  def collect_garbage
    @array = @array[@first_index..@array.length].dup
    @first_index = 0
  end
end

end
