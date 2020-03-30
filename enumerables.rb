module Enumerable
  def my_each
    if block_given?
      length = self.length
      length.times do |i|
        yield(self[i])
      end
      self
    end
    self
  end

  def my_each_with_index
    if block_given?
      length = self.length
      length.times do |i|
        yield(self[i], i)
      end
      self
    end
    self
  end
end

numbers = (1..5).to_a
result = numbers.my_each do |x|
  puts x > 3
end

print result

result = numbers.my_each_with_index do |x, i|
  puts x > 3
  puts i
end

print result
