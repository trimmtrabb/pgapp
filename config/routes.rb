Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "game#index"
  # get :user_move, to: "players#create"

  resource :player, only: :create

  # API move: "https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw"
end
