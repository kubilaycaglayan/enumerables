require './enumerables.rb'

RSpec.describe Enumerable do
  include Enumerable
  let(:arr) { [1, 2, 3] }

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
end
