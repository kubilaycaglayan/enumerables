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

  def my_all?(pattern = false)
    result = true
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
    result
  end
end
