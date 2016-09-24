require 'rspec'
require 'deck'

describe Deck do

  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "creates a deck of 52 cards" do
      expect(deck.cards).to be_a(Array)
      expect(deck.cards.size).to be(52)
      expect(deck.cards.sample).to be_a(Card)
    end

    it "should have the discard pile be an empty array" do
      expect(deck.discard_pile).to eq([])
    end
  end

  describe "#shuffle!" do
    it "shuffles cards" do
      expect(deck.shuffle!).to_not eq(Deck.new.cards)
    end

    it "returns the array of cards" do
      cards = deck.shuffle
      expect(cards).to be_a(Array)
    end
  end

  describe "#draw" do
    it "should take the desired number of cards from the top of the deck" do
      hand = deck.cards.last(5)
      expect(deck.draw(5)).to eq(hand)
    end

    it "should take a default value of one if none is given" do
      hand = deck.cards.last
      expect(deck.draw).to eq([hand])
    end
  end

  describe "#discard" do
    it "should store the discarded cards in an array" do
      card = deck.discard(deck.draw)
      expect(deck.discard_pile).to be(card)
    end
  end
end
