require './card'

class Hand
  attr_accessor :is_busted
  attr_reader :score

  LIMIT_NUMBER = 21
  CARD_SCORE = {
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '10' => 10,
    'J' => 10,
    'Q' => 10,
    'K' => 10,
    'A' => 11
  }.freeze

  def initialize(cards)
    @score = calculate_score(cards)
    @is_busted = bust?
  end

  private

  def calculate_score(cards)
    score = 0
    ranks = []
    cards.each do |card|
      score += CARD_SCORE[card.rank]
      ranks << card.rank
    end
    ace_num = count_aces(ranks)
    while need_adjust_score?(score, ace_num)
      score -= 10
      ace_num -= 1
    end
    score
  end

  def bust?
    @score > LIMIT_NUMBER
  end

  def need_adjust_score?(score, ace_num)
    score > LIMIT_NUMBER && ace_num.positive?
  end

  def count_aces(ranks)
    ranks.count('A')
  end
end
