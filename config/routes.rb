Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :edit]
  root to: "items#toppage"
  get 'index' => 'items#toppage'

end
