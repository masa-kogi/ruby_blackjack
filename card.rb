class Card
  SUITS = %w(ハート ダイヤ スペード クラブ).freeze

  RANKS = %w(A 2 3 4 5 6 7 8 9 10 J Q K).freeze

  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end
end
