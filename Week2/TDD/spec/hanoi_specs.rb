

require "rspec"
require "hanoi"



describe TowersofHanoi do

  subject(:towers) {TowersofHanoi.new}

  describe "#initialize" do
    it "creates three stacks" do
      expect(towers.stacks).to eq([[3, 2, 1], [], []])
    end
  end

  describe "#move" do
    it "can't choose an empty stack to move from" do
      error_message = "can't move from an empty stack"
      expect{ (towers.move([2, 0])) }.to raise_error(error_message)
    end

    before(:each) {towers.move([0, 1])}

    it "moves the top disk" do
      expect(towers.stacks).to eq([[3, 2],[1],[]])
    end

    it "can't move a bigger disk to a smaller disk" do
      error_message = "can't move a bigger disk to a smaller disk"
      expect{ (towers.move([0, 1])) }.to raise_error(error_message)
    end

    it "can't choose an invalid stack" do
      error_message = "must choose a valid stack"
      expect{ (towers.move([5, 0]))}.to raise_error(error_message)
    end
  end

  describe "#won" do
    before(:each) do
      towers.move([0, 1])
      towers.move([0, 2])
      towers.move([1, 2])
      towers.move([0, 1])
      towers.move([2, 0])
      towers.move([2, 1])
      towers.move([0, 1])
    end

    it "should tell you if you completed the game" do
      expect(towers.won?).to be_truthy
    end
  end
end
