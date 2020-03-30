module Enumerable
    def my_each
        if block_given?
            length = self.length
            length.times do |i|
                yield(self[i])
            end
        else
            puts "bock is not given"
        end
    end
end

include Enumerable
numbers = (1..5).to_a
numbers.my_each do |x|
    puts x**2
end