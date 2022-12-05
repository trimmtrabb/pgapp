class PlayersController < ApplicationController
  def create
    if Game::GESTURES.include?(move = params[:commit])
      user = Player.new(move: move)
      
  end
end
