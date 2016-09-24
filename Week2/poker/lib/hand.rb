require_relative 'deck'
require_relative 'card'

class Hand
  attr_reader :cards, :rank

  POKER_HAND_RANKS = {
    :royal_flush => 9,
    :straight_flush => 8,
    :four_kind => 7,
    :full_house => 6,
    :flush => 5,
    :straight => 4,
    :three_kind => 3,
    :two_pair => 2,
    :pair => 1,
    :high_card => 0
  }

  def self.poker_hand_ranks
    POKER_HAND_RANKS
  end

  def initialize(cards)
    @cards = cards
    @rank = 0
  end

  def sort!
    @cards.sort_by! { |card| card.value }
  end

  def each(&prc)
    @cards.each { |card| prc.call(card) }
  end

  def show
    each { |card| puts card.to_s }
  end

  def high_card
    hi_card = nil
    each do |card|
      hi_card = card if hi_card.nil? || card.value > hi_card.value
    end
    hi_card
  end

  def pair
    card_pairs = []
    card_vals = @cards.map{ |card| card.value }
    card_vals.each_with_index do |val, idx|
      if card_vals.count(val) == 2
        card_pairs << @cards[idx]
      end
    end
    card_pairs
  end

  def pair?
    if pair.size == 2
      true
    else
      false
    end
  end

  def two_pair?
    if pair.size == 4
      true
    else
      false
    end
  end

  def three_kind
    card_trio = []
    sort!
    (0..2).each do |idx|
      card1 = @cards[idx]
      card2 = @cards[idx + 1]
      card3 = @cards[idx + 2]
      if card1 == card2 && card2 == card3
        card_trio = [card1, card2, card3]
      end
    end
    card_trio
  end

  def three_kind?
    if three_kind.empty?
      false
    else
      true
    end
  end

  def full_house
    return three_kind + pair if full_house?
    []
  end

  def full_house?
    if three_kind? && pair?
      true
    else
      false
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  #deck = Deck.new
  #deck.shuffle!

  three_kind = [
    Card.new(:Diamonds, 2),
    Card.new(:Hearts, 2),
    Card.new(:Spades, 13),
    Card.new(:Hearts, 13),
    Card.new(:Clubs, 2)
  ]

  hand = Hand.new(three_kind)
  hand.sort!
  hand.show
  puts ""
  hand.full_house.each {|card| puts card.to_s}
  p hand.full_house?
  #puts "High card is the #{hand.high_card}"
end
