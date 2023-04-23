require './abstract_player'

class Dealer < AbstractPlayer
  def fix_hand(game)
    while hand.score < 17
      card = hit(game.deck)
      game.show_card(self, card)
      add_card(card)
      set_hand
    end
  end
end
