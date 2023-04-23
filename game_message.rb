require './card'
require './player'
require './dealer'

module GameMessage
  RESULT_MESSAGE = {
    0 => '%sの勝ちです!',
    1 => '%sの負けです。',
    2 => '%sは引き分けです。'
  }.freeze

  def declare_start(player_num)
    puts "#{player_num}人対戦のブラックジャックを開始します。"
  end

  def show_current_score(player)
    print "#{player.name}の現在の得点は#{player.hand.score}です。"
  end

  def show_card(player, card)
    puts "#{player.name}の引いたカードは#{card.suit}の#{card.rank}です。"
  end

  def down_dealer_second_card
    puts 'ディーラーの引いた2枚目のカードはわかりません。'
  end

  def ask_hit_or_stand
    print 'カードを引きますか？（Y/N）'
  end

  def ask_enter_valid_answer
    print 'YかNを入力してください。'
  end

  def show_dealer_second_card(card)
    puts "ディーラーの引いた2枚目のカードは#{card.suit}の#{card.rank}でした。"
  end

  def show_final_score(player)
    puts "#{player.name}の得点は#{player.hand.score}です。"
  end

  def declare_end
    puts 'ブラックジャックを終了します。'
  end
end
