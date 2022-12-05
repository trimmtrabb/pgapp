require "rest-client"

class PlayersController < ApplicationController
  def create
    move = params[:commit]
    if Game::GESTURES.include?(move)
      user = Player.new(name: "User", move: move)
      server = Player.new(name: "Server", move: get_server_move)
      result = { result: "The winner is #{Game.winner(user, server).name}!", 
                 details: { user_move: user.move,
                            server_move: server.move } }
      flash[:result] = result
      redirect_to root_url # template rendering only in Network tab!
    # else # not tested
    #   flash.now[:alert] =
    #     "Unknown gesture: #{move}. Please choose from: #{Game::GESTURES.join(, )}."
    #   render :root
    end
  end

  def get_server_move
    url = # NOT SECURE: needs to be defined elsewhere in a real app
      if Rails.env.development?
        "https://private-anon-32350407bb-curbrockpaperscissors.apiary-mock.com/rps-stage/throw"
      elsif Rails.env.production?
        "https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw"
      end
    response = RestClient.get(url)
    server_move = JSON.parse(response)["body"]
  end
end
