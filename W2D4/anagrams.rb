def first_anagram?(first, second)
  first.chars.permutation.to_a.map(&:join).include?(second)
end

# p first_anagram?('elvis', 'lives')


def second_anagram?(first, second)
  return false unless first.length == second.length
  first.each_char do |letter|
    first.delete!(letter)
    second.delete!(letter)
  end
  second.empty?
end


# p second_anagram?('elvis', 'lives')


def third_anagram?(first, second)
  first.sort == second.sort
end


def fourth_anagram?(first, second)
  counter = Hash.new(0)

  first.chars.each_index do |i|
    counter[first[i]] += 1
    counter[second[i]] -= 1
  end

  counter.values.all? {|val| val == 0 }
end

p fourth_anagram?('elvis', 'lives')
