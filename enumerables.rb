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
      return arr_result
    else
      to_enum(:my_select)
    end
  end

  def my_all?
    
  end
end

filtered = (1..6).to_a.my_select

print filtered