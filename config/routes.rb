Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :edit]
  get '/users/info' => 'users#info'
  get 'users/:id/card' => 'users#card'
  get '/users/:id/card/create' => 'users#card_create'
  get 'users/logout' => 'users#logout'
  get 'users/log_out' => 'users#log_out'
  resources :items, only: [:show]
end