class Player < Game
  attr_accessor :move
  validates :move, inclusion: { in: GESTURES }

  # Player.new(move: 'rock')
  # Player.new(move: 'paper')
  def beats?(opponent)
    case move
    when 'rock'
      opponent.move == 'scissors'
    when 'paper'
      opponent.move == 'rock'
    when 'scissors'
      opponent.move == 'paper'
    end
  end
end
