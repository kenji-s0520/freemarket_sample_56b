Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index]
  root to: "groups#index"
  get 'index' => 'items#toppage'

end
