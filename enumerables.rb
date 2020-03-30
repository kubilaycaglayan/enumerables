# rubocop:disable Style/CaseEquality

module Enumerable
  def my_each
    if block_given?
      length = self.length
      length.times do |i|
        yield(self[i])
      end
      self
    else
      to_enum(:my_each)
    end
  end

  def my_each_with_index
    if block_given?
      length = self.length
      length.times do |i|
        yield(self[i], i)
      end
      self
    else
      to_enum(:my_each_with_index)
    end
  end

  def my_select
    if block_given?
      arr_result = []
      length = self.length
      length.times do |i|
        arr_result << self[i] if yield(self[i])
      end
      arr_result
    else
      to_enum(:my_select)
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def my_all?(pattern = false)
    length = self.length
    if block_given?
      length.times do |i|
        block_result = yield(self[i])
        condition_one = block_result == false
        condition_two = block_result.nil?
        (return false) if condition_one || condition_two
      end
    elsif pattern
      length.times do |i|
        return false unless pattern === self[i]
      end
    else
      length.times do |i|
        return false if (self[i] == false) || self[i].nil?
      end
    end
    true
  end

  def my_any?(pattern = false)
    length = self.length
    if block_given?
      length.times do |i|
        block_result = yield(self[i])
        (return true) if block_result
      end
    elsif pattern
      length.times do |i|
        return true if pattern === self[i]
      end
    else
      length.times do |i|
        return true if self[i]
      end
    end
    false
  end

  def my_none?(pattern = false)
    length = self.length
    if block_given?
      length.times do |i|
        block_result = yield(self[i])
        (return false) if block_result
      end
    elsif pattern
      length.times do |i|
        return false if pattern === self[i]
      end
    else
      length.times do |i|
        return false if self[i]
      end
    end
    true
  end

  def my_count(arg = false)
    length = self.length
    count = 0
    if block_given?
      length.times do |i|
        count += 1 if yield(self[i])
      end
    elsif arg
      length.times do
        count += 1 if self[i] == arg
      end
    end
    length
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def my_map
    length = self.size
    result = []
    if block_given?
      length.times do |i|
        result << yield(self.to_a[i])
      end
      result
    else
      to_enum(:my_map)
    end
  end
end

# rubocop:enable Style/CaseEquality
def my_test
  puts '------> my_any?'.upcase
  puts(%w[ant bear cat].my_any? { |word| word.length >= 3 }) #=> true
  puts(%w[ant bear cat].my_any? { |word| word.length >= 4 }) #=> true
  puts %w[ant bear cat].my_any?(/d/) #=> false
  puts [nil, true, 99].my_any?(Integer) #=> true
  puts [nil, true, 99].my_any? #=> true
  puts [].my_any? #=> false
  puts '------> my_none?'.upcase
  puts(%w[ant bear cat].my_none? { |word| word.length == 5 }) #=> true
  puts(%w[ant bear cat].my_none? { |word| word.length >= 4 }) #=> false
  puts %w[ant bear cat].my_none?(/d/) #=> true
  puts [1, 3.14, 42].my_none?(Float) #=> false
  puts [].my_none? #=> true
  puts [nil].my_none? #=> true
  puts [nil, false].my_none? #=> true
  puts [nil, false, true].my_none? #=> false
  puts '-------> my_map?'.upcase
  print (1..4).my_map { |i| i*i }      #=> [1, 4, 9, 16]
  puts
  print (1..4).my_map { "cat"  }   #=> ["cat", "cat", "cat", "cat"]
  puts
end
my_test
