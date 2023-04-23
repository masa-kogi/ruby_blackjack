require './hand'
require './deck'

class AbstractPlayer
  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @cards = []
  end

  def hit(deck)
    deck.deal_card
  end

  def add_card(card)
    @cards << card
  end

  def set_hand
    @hand = Hand.new(@cards)
  end

  def fix_hand(deck)
    raise NotImplementedError, 'This is abstract method. Implement in the subclass.'
  end
end
