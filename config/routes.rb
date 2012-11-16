Zgame::Application.routes.draw do
  devise_for :users

  root :to => 'mains#index'
  resources :games do
    resources :players
  end

  # Join a game via key
  get "/join/:game_key" => "joins#new"

  #update caught status of player
  post "/caught" => "players#caught"

  resources :invites, :only => [:create, :update]
end
