require 'byebug'

class Array

  def my_uniq
    hash = Hash.new(00)

    self.each do |i|
      hash[i] = self[i]
    end

    hash.keys
  end

  def two_sum
    result = []
    self.each_index do |i|
      ((i + 1)...self.length).each do |j|
        result << [i,j] if self[i] + self[j] == 0
      end
    end
    result
  end

  def my_transpose
    transposed = Array.new(self.length) { [] }
    self.each do |row|
      row.length.times do |j|
        transposed[j] << row[j]
      end
    end

    transposed
  end

  def stock_picker
    prices_hash = Hash.new { |h, k| h[k] = [ ] }

    self.each_index do |i|
      ((i + 1)...self.length).each do |j|
        prices_hash[[i, j]] = self[j] - self[i]
      end
    end

    hash = prices_hash.sort_by { |k, v| v }.reverse.to_h
    hash.keys.first
  end



end
