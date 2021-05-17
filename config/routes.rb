Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
   }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  get 'cards/new'
  get 'users/show'
  root to: 'items#index'
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :items do
    resources :purchases, only: [:index, :create]
    resources :comments, only: :create
    #post 'order', on: :member
  end
end
