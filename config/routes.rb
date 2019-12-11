Rails.application.routes.draw do
  #yamashita sns認証追記
  devise_for :users
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
  
  #mishima ユーザー新規登録 ページのルーティングを記述
  resources :signup do  
    collection do
      get 'member_information'
      get 'phone_number'
      get 'address'
      get 'card_information' 
      get 'end'
      get 'done'
      post 'address_create'
    end
  get '/users/buy' => 'items#purchase'
  end

  #yoshikawa 商品出品ページのルーティングを記述
  resources :items, only: [:show, :new, :create, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :items, only: [:show, :new, :purchase, :buy]do
    member do
      get :purchase
      post :buy
      get :done
    end
end

  resources :card, only: [:new, :show, :create] do
    collection do
      post 'show', to: 'card#show'
      post 'delete', to: 'card#delete'
      get  'card', to: 'card#card'
    end
  end

end