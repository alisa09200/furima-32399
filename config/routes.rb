Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :items do
    resources :purchases, only: [:index, :create]
    #post 'order', on: :member
  end
end
