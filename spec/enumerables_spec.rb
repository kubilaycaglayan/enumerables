require './enumerables.rb'

RSpec.describe Enumerable do
  include Enumerable
  let(:arr) { [1, 2, 3] }
  let(:words) { %w[ant bear cat] }
  let(:mixed) { [nil, true, 99] }

  describe '#my_each' do
    it 'returns exactly the same as the original function when passed a block' do
      expect(arr.my_each { |x| x }).to eql(arr.each { |x| puts x })
    end

    it 'returns an enumerator if no block is given' do
      expect(arr.my_each).to be_a(Enumerator)
    end

    it 'should throw an argument error if passed an argument' do
      expect { arr.my_each('whatever') }.to raise_error(ArgumentError)
    end
  end

  describe '#my_each_with_index' do
    it 'returns exactly the same as the original function when passed a block' do
      expect(arr.my_each_with_index { |x, i| x * 3 * i }).to eql(arr.each_with_index { |x, i| x * 3 * i })
    end

    it 'returns an enumerator if no block is given' do
      expect(arr.my_each_with_index).to be_a(Enumerator)
    end

    it 'should throw an argument error if passed an argument' do
      expect { arr.my_each_with_index('whatever') }.to raise_error(ArgumentError)
    end
  end

  describe '#my_select' do
    it 'returns exactly the same as the original function when passed a block' do
      expect(arr.my_select(&:even?)).to eql(arr.select(&:even?))
    end

    it 'returns an enumerator if no block is given' do
      expect(arr.my_select).to be_a(Enumerator)
    end

    it 'should throw an argument error if passed an argument' do
      expect { arr.my_select('whatever') }.to raise_error(ArgumentError)
    end
  end

  describe '#my_any?' do
    it 'checks the condition in the given block for every' \
       'item and returns true if block returns true at least one time' do
      expect(words.my_any? { |item| item.length >= 3 }).to be true
    end
    it 'If instead a pattern is supplied, the method returns whether pattern === element for any collection member' do
      expect(words.my_any?(/d/)).to be false
      expect(mixed.my_any?(Integer)).to be true
    end
    it 'returns false when an empty array is given' do
      expect([].my_any?).to be false
    end
  end

  describe '#my_none' do
    it 'checks the condition in the given block for every' \
    'item and returns true if block returns false for all items' do
      expect(words.my_none? { |item| item.length >= 3 }).to be false
    end
    it 'If instead a pattern is supplied, the method returns whether pattern !== element for any collection member' do
      expect(words.my_none?(/d/)).to be true
      expect(mixed.my_none?(Integer)).to be false
    end
    it 'returns true when an empty array is given' do
      expect([].my_none?).to be true
    end
  end

  describe '#my_all?' do
    it 'checks the condition in the given block for every' \
       'item and returns true if block returns true every time' do
      expect(words.my_all? { |item| item.length >= 3 }).to be true
    end
    it 'If instead a pattern is supplied, the method returns whether pattern === element for all collection member' do
      expect(words.my_all?(/d/)).to be false
      expect(mixed.my_all?(Integer)).to be false
    end
    it 'returns false when an empty array is given' do
      expect([].my_all?).to be true
    end
  end

  describe '#my_count' do
    it 'counts the items in an array' do
      expect(arr.my_count).to be 3
    end
    it 'counts the specific item ' do
      expect(arr.my_count(1)).to eq 1
    end
    it 'counts how many time the block condition is fulfilled' do
      expect(arr.my_count(&:odd?)).to be 2
    end
  end
  describe '#my_inject' do
    it 'accepts a symbol that references a block as an argument' do
      expect(arr.my_inject(:+)).to eq(6)
    end
    it 'accepts a block' do
      expect(arr.my_inject { |sum, n| sum + n }).to eq(6)
    end

    it 'accepts an argument as a an initiator value well as symbol as a block reference' do
      expect((5..10).my_inject(1, :*)).to eq(151_200)
    end

    it 'accepts an argument as an initiator value well a block' do
      expect(arr.my_inject(1) { |product, n| product * n }).to eq(6)
    end

    it 'accepts an argument as an initiator value well a block' do
      expect(words2.my_inject(&longest)).to eq('dinosaur')
    end
  end
end
