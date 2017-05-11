def first_anagrams?(str1, str2)
  perms = str1.chars.permutation.to_a
  perms.each do |array|
    return true if array.join == str2
  end
  false
end

# p first_anagrams?("cat", "taa")

def second_anagrams?(str1, str2)
  str1.chars.each do |let1|
    if str2.include?(let1)
      str1.delete!(let1)
      str2.delete!(let1)
    end
  end
  str1.empty? && str2.empty?
end
 #
  p second_anagrams?("carpet", "tarpce")
  p second_anagrams?("cat", "true")
  p second_anagrams?("cate", "tac")


def quick_sort(st_ary)
  return st_ary if st_ary.length <= 1

  pivot = st_ary.first
  left = st_ary.drop(1).select { |letter| letter < pivot }
  right = st_ary.drop(1).select { |letter| letter >= pivot }

  quick_sort(left) + [pivot] + quick_sort(right)
end

# p quick_sort("joana".chars)
class Array
  def merge_sort(array)
    return array if array.length <= 1

    middle = array.length / 2

    left = merge_sort(array[0...middle])
    right = merge_sort(array[middle..-1])

    Array.merge!(left, right)

  end

  def self.merge!(left, right)
    result = []

    until left.empty? || right.empty?
    case left.first >= right.first
    when true
      result << right.shift
    when false
      result << left.shift
    end
    end

    result.concat(left)
    result.concat(right)
  end
end
# a = Array.new
# p a.merge_sort("martin".chars)

def third_anagrams?(st1, st2)
  a = Array.new
  string1 = quick_sort(st1.chars)
  string2 = a.merge_sort(st2.chars)
  string1 == string2
end

# p third_anagrams?("ca", "tac")


def fourth_anagram?(st1, st2)
  letters = Hash.new(0)

  st1.chars.each do |char|
    letters[char] += 1
  end

  st2.chars.each do |char|
    letters[char] -= 1
  end

  letters.values.all? { |el| el == 0 }

end

p fourth_anagram?("caooot", "tacc")
