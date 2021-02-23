Rails.application.routes.draw do
  devise_for :users do
    resources :items, only: [:index, :create]
  end

  root to: 'items#index'

end
