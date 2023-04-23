require './game'

def main
  ask_player_num
  player_num = get_player_num
  game = Game.new(player_num)
  game.start
end

def ask_player_num
  print '何人でプレイしますか？（2 or 3 or 4）'
end

def ask_enter_valid_num
  print '2から4の整数を入力してください。'
end

def valid_num?(answer)
  (answer.to_f % 1).zero? && [2, 3, 4].include?(answer)
end

def get_player_num
  answer = gets.chomp.to_i

  unless valid_num?(answer)
    loop do
      ask_enter_valid_num
      ask_player_num
      answer = gets.chomp.to_i
      break if valid_num?(answer)
    end
  end
  answer
end

main
