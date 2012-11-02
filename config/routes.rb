Zgame::Application.routes.draw do
  devise_for :users

  root :to => 'mains#index'

  resources :games do
    resources :players
  end

end
