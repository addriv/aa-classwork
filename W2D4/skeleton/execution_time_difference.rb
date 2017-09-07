

def my_min(list)

  list.each do |num1|
  smallest = true

    list.each do |num2|
      smallest = false if num2 < num1
    end

    return num1 if smallest
  end


end

 # my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])


def my_min_fast(list)
  smallest = list.first

  list[1..-1].each { |n| smallest = n if n < smallest }
  smallest
end

# p my_min_fast([ 0, 3, 5, 4, -5, 10, 1, 90 ])


def largest_con_sum(arr)
  subsets = []

  arr.each_index do |i|
    j = i
    until j >= arr.length
      subsets << arr[i..j]
      j += 1
    end
  end
  subsets.map { |arr| arr.reduce(&:+) }.max
end


def largest_con_sum_fast(arr)
  current_sum =  arr[0]
  largest_sum = arr[0]

  arr[1..-1].each do |el|
    current_sum += el
    largest_sum = current_sum if current_sum > largest_sum
    current_sum = 0 if current_sum  < 0
  end

  largest_sum
end






p largest_con_sum_fast([5,3,-7])
