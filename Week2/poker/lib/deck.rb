require_relative 'card'

class Deck
  attr_reader :cards, :discard_pile

  def initialize
    @cards = []
    @discard_pile = []
    create_cards
  end

  def view
    @cards.each { |card| puts card.to_s }
  end

  def last(num_of_cards)
    @cards.last(num_of_cards)
  end

  def shuffle!
    @cards.shuffle!
  end

  def draw(num_of_cards = 1)
    @cards.pop(num_of_cards)
  end

  def discard(cards)
    @discard_pile += cards
  end

  private
  def create_cards
    Card.card_suits.each do |suit|
      Card.card_values.each_pair do | _, value|
        @cards << Card.new(suit, value)
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  deck = Deck.new
end
