class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  CARD_SUITS = [:Hearts, :Spades, :Clubs, :Diamonds]
  CARD_VALUES = {
    :Two => 2,
    :Three => 3,
    :Four => 4,
    :Five => 5,
    :Six => 6,
    :Seven => 7,
    :Eight => 8,
    :Nine => 9,
    :Ten => 10,
    :Jack => 11,
    :Queen => 12,
    :King => 13,
    :Ace => 14
  }

  def self.card_suits
    CARD_SUITS
  end

  def self.card_values
    CARD_VALUES
  end

  def <=>(other_card)
    @value <=> other_card.value
  end

  def ==(other_card)
    (self <=> other_card).zero?
  end

  def to_s
    "#{CARD_VALUES.key(@value)} of #{@suit}"
  end
end
