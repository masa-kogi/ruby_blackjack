require './deck'
require './dealer'
require './player'
require './game_message'

class Game
  WIN = 0
  LOSE = 1
  EVEN = 2

  include GameMessage

  attr_accessor :deck

  def initialize(player_num)
    @player_num = player_num
    @deck = Deck.new
    @dealer = Dealer.new('ディーラー')
    @players = [Player.new('あなた')]
    1.upto(player_num - 2) { |num| @players << Dealer.new("プレーヤー#{num}") }
  end

  def start
    declare_start(@player_num)

    insert_blank_line
    sleep(1.5)

    @players.each do |player|
      2.times do
        card = player.hit(@deck)
        show_card(player, card)
        player.add_card(card)
      end
      insert_blank_line
      sleep(1.5)
    end

    dealer_card1 = @dealer.hit(@deck)
    show_card(@dealer, dealer_card1)
    @dealer.add_card(dealer_card1)

    dealer_card2 = @dealer.hit(@deck)
    down_dealer_second_card
    @dealer.add_card(dealer_card2)

    insert_blank_line
    sleep(1.5)

    @players.each do |player|
      player.set_hand
      player.fix_hand(self)
    end

    insert_blank_line
    sleep(1.5)

    show_dealer_second_card(dealer_card2)

    @dealer.set_hand
    @dealer.fix_hand(self) unless @players.all? { |player| player.hand.is_busted }

    insert_blank_line
    sleep(1.5)

    @players.each do |player|
      show_final_score(player)
      sleep(1.5)
    end
    show_final_score(@dealer)

    insert_blank_line
    sleep(1.5)

    results = judge
    show_result(results)

    insert_blank_line

    declare_end
  end

  def judge
    results = {}

    @players.each do |player|
      results[player.name] = if player.hand.is_busted
                               LOSE
                             elsif @dealer.hand.is_busted
                               WIN
                             elsif player.hand.score < @dealer.hand.score
                               LOSE
                             elsif player.hand.score > @dealer.hand.score
                               WIN
                             else
                               EVEN
                             end
    end
    results
  end

  def show_result(results)
    results.each do |name, result|
      puts format(RESULT_MESSAGE[result], name)
    end
  end

  def insert_blank_line
    puts ''
  end
end
