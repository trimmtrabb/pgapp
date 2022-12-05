class Player < Game
  attr_accessor :name, :move
  validates :move, inclusion: { in: GESTURES }

  # Player.new(name: 'User', move: 'rock')
  # Player.new(name: 'Server', move: 'paper')
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
