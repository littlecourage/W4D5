
def anagram?(str_1, str_2)
    chars = str_1.split("") # O(n)
    anagrams = chars.permutation.map { |char| char.join("") } # 0(n!) + 0(n^2) => 0(n!)
    anagrams.each { |anagram| return true if anagram == str_2 } #0(n)
    false
end

#0(n!)

def second_anagram?(str_1, str_2)
    str_1.each_char do |char| # O(n)
        idx = str_2.index(char) # O(n)
        return false if idx.nil? # O(1)
        str_2 = str_2[0...idx] + str_2[idx+1..-1] #O(n)
    end
    str_2.empty? # O(1)
end

#O(n * (2n + 1)) => O(n^2)

def third_anagram?(str_1, str_2)
  str_1_sorted = str_1.sort # O(nlog(n)), quicksort
  str_2_sorted = str_2.sort 

  str_1_sorted == str_2_sorted
end

# O (nlog(n))


p second_anagram?("gizmo", "sally") 
p second_anagram?("elvis", "lives")



def fourth_anagram?(str_1, str_2)
  count_1 = Hash.new(0)
  count_2 = Hash.new(0)

  str_1.each_char { |char| count_1[char] += 1 } #O(n)
  str_2.each_char { |char| count_2[char] += 1 } #O(n)

  return count_1 == count_2
end


def bonus_anagram?(str_1, str_2)
  count = Hash.new(0)
  str_1.each_char { |char| count_1[char] += 1 }
  str_2.each_char { |char| count_1[char] -= 1 }

  count.values.all?(0)
end












def fourth_anagram?(str_1, str_2)
    hash_1 = Hash.new(0) #0(1)
    hash_2 = Hash.new(0) #0(1)

    str_1.each_char { |char| hash_1[char] += 1 } # O(n)
    str_2.each_char { |char| hash_2[char] += 1 } # O(n)

    hash_1 == hash_2 # 0(n) or 0(1)
end

# O(n)

def bonus_anagram?(str_1, str_2)
  hash_1 = Hash.new(0)

  str_1.each_char { |char| hash_1[char] += 1 } # O(n) #carrot
  str_2.each_char { |char| hash_2[char] -= 1 } # O(n) #cata

  hash_1.values.all?(0) #O(n)
end

# O(n), but using half the memory from fourth anagram