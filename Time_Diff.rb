require 'byebug'
def my_min(ary)
  min = 0
  ary.each_with_index do |el1, idx1|
    ary.each_with_index do |el2, idx2|
      next if idx1 >= idx2
      if el1 > el2
        min = el2 if el2 < min
      elsif el1 < el2
        min = el1 if el1 < min
      else
        min = el1 if el1 < min
      end
    end
  end
  min
end

def my_min(ary)
  min = 0
  ary.each do |el|
    if el < min
      min = el
    end
  end
  min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

def largest_contiguous_subsum(list)
  max = list.first
  current = list.first
  i = 1

  return list.max if list.all? { |el| el < 0 }

  while i < list.length
    if current < 0
      current = 0
    end

    current += list[i]
    max = current if current > max

    i += 1
  end
  max
end


# list = [5, 3, -7]
# p largest_contiguous_subsum(list)
#
# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])
