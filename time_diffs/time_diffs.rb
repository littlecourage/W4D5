def my_min(arr)
  sorted = false
  until sorted # O(n)
    sorted = true
    (0...arr.length - 1).each do |index|  # O(n)
      first_num = arr[index] 
      next_num = arr[index + 1]
      if first_num > next_num
        arr[index] = next_num
        arr[index + 1] = first_num
        sorted = false
      end
    end
  end
  arr[0]
end

# O(n * n) = O(n^2)


def my_faster_min(arr)
  min = arr[0]
  (1...arr.length).each do |index|
    num = arr[index]
    min = num if num < min
  end
  min
end

# O(n)

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_faster_min(list)  # =>  -5


def largest_contiguous_subsum(list)
  new_list = []
  i = 0
  while i < list.length # O(n)
    j = i
    while j < list.length # O(n)
        sub = list[i..j] # O(n)
        new_list << sub
        j += 1
    end
    i += 1
  end
  largest_sub_sum = new_list[0].sum #O(n)
  
  new_list.each do |sub| # O(n)
    sub_sum = sub.sum # O(n)
    largest_sub_sum = sub_sum if largest_sub_sum < sub_sum
  end

  p new_list
  return largest_sub_sum
end

# O(n^3 + n + n^2) = O(n^3)

list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list)

#  list = [5, 1, -3, 20, -2, 1]
#  p largest_contiguous_subsum(list)

def better_lsc(arr)
  max_sum = arr[0] 
  curr_sum = arr[0] 
  (1...arr.length).each do |i| #O(n)
    ele = arr[i] 
    curr_sum += ele
    if curr_sum < 0
      curr_sum = 0 
    else 
      if curr_sum > max_sum
        max_sum = curr_sum
      end
    end
  end
  return max_sum
end

# O(n) run time with O(1) memory because the only addition storage are variables/integers

p better_lsc(list)