require 'tdd'
require 'rspec'

describe Array do

  describe "#my_uniq" do
    let(:an_array) { [1,2,1,3,3] }

    it "should not modify the original array" do
      an_array.my_uniq
      expect(an_array).to eq([1,2,1,3,3])
    end

    it "should return only unique elements" do
      expect(an_array.my_uniq).to eq(an_array.uniq)
    end

    it "should not call #uniq" do
      expect(an_array.my_uniq).to_not receive(:uniq)
    end
  end

  describe "#two_sum" do
    let(:array) {[-1, 0, 2, -2, 1]}

    it "should find all pairs where the values sum to 0" do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "finds multiple pairs of the same elements" do
      expect([5, -5, -5].two_sum).to eq([[0, 1], [0, 2]])
    end
  end

  describe "#my_transpose" do
    let(:matrix) do
      [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
    end

    it "should not modify the original array" do
      matrix.my_transpose
      expect(matrix).to_not eq(matrix.transpose)
    end

    it "should transpose rows to colums" do
      expect(matrix.my_transpose).to eq(matrix.transpose)
    end

    it "should not call #transpose" do
      expect(matrix.my_transpose).to_not receive(:transpose)
    end
  end
end


describe "#stock_picker" do

    it "should find the most profitable pair of days" do
      expect(stock_picker([10, 20, 5])).to eq([1, 2])
    end

    it "should not return days out of order" do
      expect(stock_picker([0, 20])).to_not eq([1, 0])
    end

end
