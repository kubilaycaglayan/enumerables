require './enumerables.rb'

RSpec.describe Enumerable do
  include Enumerable

  describe "#sum" do
    it "returns the sum of a and b" do
      expect(sum(3, 9)).to eql(12)
    end
  end

  describe "#my_each" do
    it "returns the range as an array" do
      expect(3.my_each { |x| x } ).to eql(3)
    end
  end
end


