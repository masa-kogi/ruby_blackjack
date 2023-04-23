require './abstract_player'

class Player < AbstractPlayer
  STAND = 'N'.freeze

  def fix_hand(game)
    loop do
      game.show_current_score(self)
      game.ask_hit_or_stand
      answer = select_hit_or_stand(game)

      puts answer

      break if answer == STAND

      card = hit(game.deck)
      game.show_card(self, card)
      add_card(card)
      set_hand

      break if hand.is_busted
    end
  end

  private

  def select_hit_or_stand(game)
    answer = gets.chomp.upcase

    unless valid_answer?(answer)
      loop do
        game.ask_enter_valid_answer
        game.ask_hit_or_stand
        answer = gets.chomp.upcase
        break if valid_answer?(answer)
      end
    end
    answer
  end

  def valid_answer?(answer)
    %w[Y N].include?(answer)
  end
end
