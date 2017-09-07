def two_sum?(arr, target)
  arr.each_index do |i|
    j = i+1
    until j >= arr.length
      steps += 1
      return true if arr[i] + arr[j] == target
      j += 1
    end
  end
  false
end


def okay_two_sum?(arr, target)
  sorted = arr.sort #this is suppose to be merge sort
  sorted.each_with_index do |el, i|
    return true if sorted.bsearch { |el2| el2 == target - el } != nil
  end
  false
end


def hash_two_sum?(arr, target)
  hash = Hash.new(false)
  arr.each do |el|
    hash[el] = true
  end

  arr.each do |el|
    next if target == el
    return true if hash[target - el]
  end

  false
end


test = [-4, 1, 0, 3, 5]

p hash_two_sum?(test, 0)
p hash_two_sum?(test, 8)
p hash_two_sum?(test, -1)
p hash_two_sum?(test, 1000)
p hash_two_sum?(test, 3)
