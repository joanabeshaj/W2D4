
require 'byebug'

# n^2
def bad_two_sum?(array, target)
  (0...array.length - 1).each do |idx1|
    (idx1 + 1...array.length).each do |idx2|
      return true if array[idx1] + array[idx2] == target
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

#nlog(n)
def okay_two_sum?(array, target)
  sorted_array = array.sort #nlog(n)

  until sorted_array.length == 1 #n
    sum = sorted_array.first + sorted_array.last
    return true if sum == target
    if sum > target
      sorted_array.pop
    elsif sum < target
      sorted_array.shift
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false


# O(n)
def good_two_sum?(array, target)
  hash = {}
  result = []

  array.each do |el|
    hash[el] = true
  end


  array.each do |el|
    result << hash[target - el]
  end

  result.reject! { |el| el == nil }
  p result.length > 1

end

arr = [0, 1, 5, 7]
# p good_two_sum?(arr, 6) # => should be true
p good_two_sum?(arr, 10) # => should be false
