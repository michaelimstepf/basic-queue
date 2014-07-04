# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'basic_queue/version'

Gem::Specification.new do |spec|
  spec.name          = "basic_queue"
  spec.version       = BasicQueue::VERSION
  spec.authors       = ["Michael Imstepf"]
  spec.email         = ["michael.imstepf@gmail.com"]
  spec.summary       = %q{A first-in-first-out (FIFO) queue data structure.}
  spec.description   = %q{It supports the usual enqueue and dequeue operations, along with methods for peeking at the first item, testing if the queue is empty and counting the number of items in the queue.}
  spec.homepage      = "https://github.com/michaelimstepf/basic-queue"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
