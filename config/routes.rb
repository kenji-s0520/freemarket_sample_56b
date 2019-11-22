Rails.application.routes.draw do
  devise_for :users   #mishima
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:index, :edit]
  root to: "items#toppage"
  get 'index' => 'items#toppage'
  get '/users/info' => 'users#info'
  get 'users/card' => 'users#card'
  get '/users/card/create' => 'users#card_create'
  get '/users/logout' => 'users#log_out'
  get 'users/login' => 'users/login'
  get '/items/buy' => 'items#purchase'
  resources :items, only: [:show, :new]
  resources :signup do  #mishima ユーザー新規登録ページ
    collection do
      get 'user_reg'
      get 'user_reg2'
      get 'user_reg3'
      get 'user_reg4' 
      get 'user_reg5'
      get 'done'
      post 'address_create'
    end
  end
end