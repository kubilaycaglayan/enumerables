# rubocop:disable Style/CaseEquality, Metrics/ModuleLength
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

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength
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
    length = size
    result = []
    if block_given?
      length.times do |i|
        result << yield(to_a[i])
      end
      result
    else
      to_enum(:my_map)
    end
  end

  def my_inject(initial = nil, sym = nil)
    calculation = {
      :+ => proc { |x, y| x + y },
      :- => proc { |x, y| x - y },
      :/ => proc { |x, y| x / y },
      :* => proc { |x, y| x * y }
    }
    length = size
    if block_given?
      if initial
        accumulation = initial
        length.times do |i|
          accumulation = yield(accumulation, to_a[i])
        end
      else
        accumulation = to_a[0]
        (length - 1).times do |i|
          accumulation = yield(accumulation, to_a[i + 1])
        end
      end
      accumulation
    elsif initial.is_a? Symbol
      accumulation = to_a[0]
      (length - 1).times do |i|
        accumulation = calculation[initial].call(accumulation, to_a[i + 1])
      end
    else
      accumulation = initial
      length.times do |i|
        accumulation = calculation[sym].call(accumulation, to_a[i])
      end
    end
    accumulation
  end

  def my_map_modified(proc_in = nil)
    length = size
    result = []
    if proc_in || (proc_in && block_given?)
      length.times do |i|
        result << proc_in.call(to_a[i])
      end
      result
    elsif block_given?
      length.times do |i|
        result << yield(to_a[i])
      end
      result
    else
      to_enum(:my_map)
    end
  end
end

def multiply_els(array)
  array.my_inject(:*)
end

# rubocop:enable Style/CaseEquality, Metrics/ModuleLength, Metrics/MethodLength
