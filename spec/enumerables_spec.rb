require './enumerables.rb'

RSpec.describe Enumerable do
  include Enumerable
  let(:arr) { [1, 2, 3] }

  describe '#sum' do
    it 'returns the sum of a and b' do
      expect(sum(3, 9)).to eql(12)
    end
  end

  describe '#my_each' do
    it 'returns the range as an array' do
      expect(arr.my_each { |x| x * 3 }).to eql(arr.each { |x| x * 3 })
    end

    it 'returns an enumerator if no block is given' do
      expect(arr.my_each).to be_a(Enumerator)
    end

    it 'should throw an argument error if passed an argument' do
      expect { arr.my_each('whatever') }.to raise_error(ArgumentError)
    end
  end
end
