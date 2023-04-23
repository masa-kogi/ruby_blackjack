require './card'

class Deck
  def initialize
    @cards = []
    Card::SUITS.each do |suite|
      Card::RANKS.each do |rank|
        @cards << Card.new(suite, rank)
      end
    end
    @cards.shuffle!
  end

  def deal_card
    @cards.pop
  end
end
