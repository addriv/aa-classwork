#TDD SPEC
require 'tdd'

describe Array do
  let(:array) { [1, 2, 1, 3, 3] }

  describe "#my_uniq" do
    it "removes duplicates" do
      expect(array.my_uniq).to eq([1, 2, 3])
    end

    it "returns same order array" do
      expect(array.my_uniq).to eq(array.uniq)
    end

    it "doesn't use #uniq" do
      expect(array).not_to receive(:uniq)
      array.my_uniq

    end
  end

  describe "#two_sum" do
    let(:no_zero) { [10, 2, 3, 5, 3] }
    let(:sum_indexes) { [-1, 0, 2, -2, 1] }
    let(:sorted_indexes) { [1, -2, -1, 0, 0, 2, 1] }

    it "returns empty array if indexes dont equal zero" do
      expect(no_zero.two_sum).to eq([ ])
    end

    it "finds indexes that add up to 0" do
      expect(sum_indexes.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "returns sorted unique arrays of indexes" do
      expect(sorted_indexes.two_sum).to eq([[0, 2,], [1, 5], [2, 6], [3, 4]])
    end
  end

  describe "#transpose" do
    let(:transpose_arr) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

    it "trasposes the given array" do
      expect(transpose_arr.my_transpose).to eq(transpose_arr.transpose)
    end
  end

  describe "#stock_picker" do
    let(:stock_prices) { [10, 5, 100, 3, 8]}
    let(:stock_prices2) { [1, 35, 10, 13, 0]}

    it "shows the most profitable pair days to sell" do
      expect(stock_prices.stock_picker).to eq([1, 2])
    end

    it "shows the most profitable pair days to buy" do
      expect(stock_prices2.stock_picker).to eq([0, 1])
    end

  end


end
