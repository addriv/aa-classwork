def naive_window(arr, w)
  current_max = nil
  arr.each_index do |i|
    j = i+w
    window = arr[i...j]
    window_range = window.max - window.min
    if current_max == nil || current_max < window_range
      current_max = window_range
    end
  end
  current_max

end


class Stack

  def initialize
    @stack = []

  end

  def pop
    @stack.pop
  end

  def push(arg)
    @stack.push(arg)
  end

  def size
    @stack.length
  end

  def empty?
    @stack.empty?
  end

end



class Queue
  def initialize
    @queue = []
  end

  def enqueue(arg)
    @queue.push(arg)
  end

  def dequeue
    @queue.shift
  end

  def size
    @queue.length
  end

  def empty?
    @queue.empty?
  end
end


class StackQueue
  def initialize
    @queue = Stack.new
    @max = nil
    @min = nil
  end

  def enqueue(arg)
    @queue.push(arg)
  end

  def dequeue
    temp_stack = Stack.new

    until @queue.empty?
      temp_stack.push(@queue.pop)
    end

    temp_stack.pop

    until temp_stack.empty?
      @queue.push(temp_stack.pop)
    end
  end

  def size
    @queue.length
  end

  def empty?
    @queue.empty?
  end

end




# def optimized(arr,w)
#   stack = []
#   max = -1000
#   min = 1000
#   max_range = -1000
#   arr.each do |el|
#     stack.shift if stack.size == w
#     stack << el
#     max = el if el > max
#     min = el if el < min
#     window_range = max - min
#     max_range = window_range if window_range > max_range
#   end
#
#   max_range
# end

p optimized([1, 0, 2, 5, 4, 8], 2)
