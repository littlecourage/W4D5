# two-sum pseudocode:
#
# loop through array
#   nested loop i index further 
#       add two nums and see if they equal target
#
#  O(n^2)

def bad_two_sum(arr, target)
    (0...arr.length - 1).each do |i|
        (i + 1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target
        end
    end
    false
end

# 0(n^2)

def okay_two_sum?(arr, target)
    arr.each do |ele| #O(n)
        return true if my_bsearch(target - ele) #O(nlog(n))
    end
end


#okay_two_sum? is O(n^2 log(n)) but w/ better optimization of bsearch it could be n log(n)
def my_bsearch(arr, target)
    return false if size == 0 #O(1)
    mid = size/2 #O(1)

    case arr[mid] <=> target #O(1)
    when 0
      return true
    when 1
      return arr.take(mid).my_bsearch(target) #O(n)
    else
      return arr.drop(mid+1).my_bsearch(target) #O(n)
    end
end

#O(nlog(n))

def two_sum_hash(arr, target)
  hash = Hash.new  # O(1)
  arr.each do |ele|  # O(n)
    hash[ele] = true  # O(1)
    return true if hash[target - ele]  #O(1)
  end
  false
end
# O(n)


