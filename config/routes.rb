Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :edit]
  get '/users/info' => 'users#info'
  get 'users/:id/card' => 'users#card'
  get '/users/:id/card/create' => 'users#card_create'
  get '/users/user_reg4'

  root to: "groups#user-login"
  root to: "users#_user-reg5"

  resources :items, only: [:show]
end