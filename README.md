# BasicQueue

A basic first-in-first-out (FIFO) queue data structure.

This gem supports the usual enqueue and dequeue operations, along with methods for peeking at the first item, testing if the queue is empty, clearing the queue and counting the number of items in the queue.

This implementation uses a singly-linked list with a non-static nested class for linked-list nodes. As a result, this data structure is more performant than implementing a queue with an array (see notes below).

## Installation

Add this line to your application's Gemfile:

    gem 'basic_queue'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install basic_queue

## Usage

Create a new instance of `Queue`:

```ruby
queue = BasicQueue::Queue.new
```

Add items to the queue:
```ruby
queue.enq 'Michael'
queue << 'Peter' # << is an alias method for enq(), you can use either method
```

Check which item is next in the queue:
```ruby
queue.peek
=> "Michael"
```

Remove item from the queue:
```ruby
queue.deq
=> "Michael"
```

Check number of items left in the queue:
```ruby
queue.length # size() is an alias method for length, you can use either method
=> 1
```

Clear queue:
```ruby
queue.clear
```

## Performance

All methods take constant time (Θ(1)). Hence, using this data structure is more performant than using an Array since Array#unshift takes linear time (Θ(n)).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/basic_queue/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
