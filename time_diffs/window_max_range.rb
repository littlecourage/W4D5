def windowed_max_range(arr, win_size)
  current_max_range = 0

  (0..arr.length - win_size).each do |i|
    window = arr[i, win_size]
    min = window.min
    max = window.max
    range = max - min
    if range > current_max_range
      current_max_range = range
    end
  end
  return current_max_range
end




# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #6




# def max_window_range(array, w)
#   current_max_range = 0
#   (0..array.length - w).each do |i|  #O(n)
#       window = array[i, i+w]  #O(w) 
#       min = window.min  #O(w)
#       max = window.max  #O(w)
#       new_max = max - min
#       if new_max > current_max_range
#         current_max_range = new_max
#       end
#   end
#   current_max_range
# end

# O(n^2)

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(ele)
    return @store.push(ele)
  end

  def dequeue
    return @store.shift
  end

  def size
    return @store.length
  end
  
  def empty?
    return @store.empty?
  end

  def peek
    return @store.last
  end 
end

class MyStack
  def initialize
    @store = []
  end

  def push(ele)
    return @store.push(ele)
  end

  def pop
    return @store.pop
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty?
  end

  def peek(num)
    return @store.first
  end

end

class StackQueue

def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  def enqueue(val)
    # O(1)
    @in_stack.push(val)
  end

  def dequeue
    queueify if @out_stack.empty?
    # If we haven't already reversed the stack, this runs in O(n). However, we
    # only have to do this once for every n dequeue operations, so it amortizes
    # to O(1)

    @out_stack.pop
  end

  private
  def queueify
    # How do you turn a stack into a queue? Flip it upside down.
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end
  
end