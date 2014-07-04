require "basic_queue/version"

module BasicQueue

# A basic queue with enqueue and dequeue methods.

# In arrays and queues based on arrays, the enqueue method
# (Array#unshift) is often expensive since it needs to iterate through each
# array member and shift each member to the right, resulting in linear running time.

# This class takes a different approach by reversing the array.
# Enqueue adds a new element to the end of the array, which runs at constant time.
# Dequeue deletes the first non-nil value of the array, also running at constant time.

# To save memory, once the array has a set of leading values with nil entries
# the array is copied into a new array without the leading empty values.
# This process can be turned on or off and the threshold can be set in the initialize method.

# @author Michael Imstepf
class Queue
  # Initializes the queue and sets variables.
  # @param garbage_collection [Boolean] switch to turn truncation of reversed array on or off
  # @param garbage_collection_threshold [Integer] threshold to specify the number of leading nil entries until the array gets truncated
  def initialize(garbage_collection = true, garbage_collection_threshold = 100_000)
    @garbage_collection = garbage_collection
    @garbage_collection_threshold = garbage_collection_threshold
    @array = []
    @first_index = 0
  end

  # Adds new item to the queue.
  # @param item [Item] the item to be enqueued
  # @return [Item] item
  def enq(item)
    @array << item
  end

  # Adds new item to the queue.
  # Alias method for #enq().
  # @param item [Item] the item to be enqueued
  # @return [Item] item
  def <<(item)
    enq(item)
  end

  # Removes item from the queue.
  # @return [Item] dequeued item
  def deq
    return nil if empty?
    
    # get item and update @first_index
    first_item = @array[@first_index]
    @array[@first_index] = nil
    @first_index += 1

    # clean up
    if @garbage_collection && (@first_index >= @garbage_collection_threshold)
      collect_garbage 
    end

    first_item
  end

  # Clears queue.
  # @return [Boolean] true
  def clear
    @array = []
    @first_index = 0
    true    
  end

  # Returns length of queue.
  # @return [Integer]
  def length
    @array.length - @first_index
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

  private

  # Truncates array.
  def collect_garbage
    @array = @array[@first_index..@array.length].dup
    @first_index = 0
  end
end

end
