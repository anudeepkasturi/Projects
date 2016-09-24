require 'rspec'
require 'hand'

describe Hand do

  let(:card1) {double("card1", :suit => :Hearts, :value => 2)}
  let(:card2) {double("card2", :suit => :Spades, :value => 12)}
  let(:card3) {double("card3", :suit => :Diamonds, :value => 13)}
  let(:card4) {double("card4", :suit => :Clubs, :value => 2)}
  let(:card5) {double("card5", :suit => :Clubs, :value => 3)}

  cards = [card1, card2, card3, card4, card5]
  subject(:hand) { Hand.new(cards)}

  describe "#initialize" do
    it "should have an array of five card instances" do
      
    end
  end

  describe "#royal_flush" do
    it "tells us if it is a Royal Flush or not"
  end

  describe "#straight_flush" do
    it "tells us if it is a Royal Flush or not"
  end

  describe "#four_kind" do
    it "tells us if it is a Four of a Kind or not"
  end

  describe "#full_house" do
    it "tells us if it is a Full House or not"
  end

  describe "#flush" do
    it "tells us if it is a Flush or not"
  end

  describe "#straight" do
    it "tells us if it is a Straight or not"
  end

  describe "#three_kind" do
    it "tells us if it is a Three of a Kind or not"
  end

  describe "#two_pair" do
    it "tells us if it is a Two Pair or not"
  end

  describe "#pair" do
    it "tells us if it is a Pair or not"
  end

  describe "#high_card" do
    it "tells us if it is a High Card or not"
  end
end
