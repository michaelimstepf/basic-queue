require 'spec_helper'

describe BasicQueue::Queue do
  describe '#enq' do
    queue = BasicQueue::Queue.new

    it 'adds item to queue' do
      queue.enq 'Michael'
      expect(queue.length).to eq 1
      queue.enq 'Peter'
      expect(queue.length).to eq 2
    end
  end

  describe '#<<' do
    queue = BasicQueue::Queue.new

    it 'adds item to queue' do
      queue << 'Michael'
      expect(queue.length).to eq 1
      queue << 'Peter'
      expect(queue.length).to eq 2
    end
  end

  describe '#deq' do
    context 'when items exist in queue' do
      queue = BasicQueue::Queue.new
      
      it 'removes item from queue' do
        queue.enq 'Michael'
        queue.enq 'Peter'
        expect(queue.deq).to eq 'Michael'
        expect(queue.deq).to eq 'Peter'      
      end
    end

    context 'when queue has been instantiated without items' do
      queue = BasicQueue::Queue.new

      it 'returns nil' do
        expect(queue.deq).to be_nil
      end
    end

    context 'when all items have been removed from queue' do
      queue = BasicQueue::Queue.new

      it 'returns nil' do
        queue.enq 'Michael'
        queue.enq 'Peter'
        expect(queue.deq).to eq 'Michael'
        expect(queue.deq).to eq 'Peter'        
        expect(queue.deq).to be_nil
      end
    end

    context 'when there is an underflow' do
      queue = BasicQueue::Queue.new

      it 'returns nil' do
        queue.enq 'Michael'
        queue.enq 'Peter'
        expect(queue.deq).to eq 'Michael'
        expect(queue.deq).to eq 'Peter'
        expect(queue.deq).to eq nil
        expect(queue.deq).to eq nil        
        expect(queue.length).to eq 0
      end
    end    
  end

  describe '#clear' do
    context 'when queue is empty' do
      queue = BasicQueue::Queue.new      

      it 'clears queue' do
        expect(queue.clear).to be_truthy
        expect(queue.length).to eq 0
        queue.enq 'Michael'
        expect(queue.deq).to eq 'Michael'
      end
    end

    context 'when queue is not empty' do
      queue = BasicQueue::Queue.new            

      it 'clears queue' do
        queue.enq 'Michael'
        queue.enq 'Peter'
        expect(queue.clear).to be_truthy
        expect(queue.length).to eq 0
        queue.enq 'Michael'
        expect(queue.deq).to eq 'Michael'        
      end
    end    
  end

  describe '#length' do
    context 'when queue has been instantiated without items' do
      queue = BasicQueue::Queue.new

      it 'returns 0' do
        expect(queue.length).to eq 0
      end
    end

    context 'when queue has 1 item' do
      queue = BasicQueue::Queue.new

      it 'returns 1' do
        queue.enq 'Michael'        
        expect(queue.length).to eq 1
      end
    end

    context 'when queue has 2 items' do
      queue = BasicQueue::Queue.new

      it 'returns 2' do
        queue.enq 'Michael'
        queue.enq 'Peter'                
        expect(queue.length).to eq 2
      end
    end

    context 'when queue has been cleared' do
      queue = BasicQueue::Queue.new

      it 'returns 0' do
        queue.enq 'Michael'
        queue.enq 'Peter'                
        queue.clear
        expect(queue.length).to eq 0
      end
    end                 
  end

  describe '#size' do
    context 'when queue has been instantiated without items' do
      queue = BasicQueue::Queue.new

      it 'returns 0' do
        expect(queue.size).to eq 0
      end
    end
  end

  describe '#empty?' do
    context 'when queue is empty' do
      queue = BasicQueue::Queue.new

      it 'returns true' do
        expect(queue.empty?).to be_truthy        
      end      
    end

    context 'when queue is not empty' do
      queue = BasicQueue::Queue.new

      it 'returns false' do
        queue.enq 'Michael'        
        expect(queue.empty?).to be_falsey        
      end      
    end    
  end         
end