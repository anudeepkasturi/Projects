require 'rspec'
require 'card'

describe Card do

  subject(:card) do
    suit = :Heart
    value = 2
    Card.new(suit, value)
  end

  describe "#initialize" do
    it "has a suit and a value" do
      expect(card.suit).to eq(:Heart)
      expect(card.value).to eq(2)
    end
  end

  describe "#<=>" do
    let(:card1) {Card.new(:Diamonds, 2)}
    let(:card2) {Card.new(:Hearts, 10)}

    it "compares the values of two equal cards" do
      expect(card1.<=>(card)).to eq(0)
    end

    it "compares the values of two unequal cards" do
      expect(card2.<=>(card1)).to eq(1)
    end
  end
end
