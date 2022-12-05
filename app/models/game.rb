class Game
  include ActiveModel::Model

  GESTURES = %w(rock paper scissors)

  def self.winner(player1, player2)
    player1.beats?(player2) ? player1.name : player2.name
  end
end
