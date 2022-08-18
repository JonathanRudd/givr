Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :pickups, only: [:new, :create]
  end
  resources :pickups, only: [:index, :show, :update, :destroy]

  # get 'giveaways', to: 'items#my_items', as: 'giveaways'

  get 'dashboard', to: 'pages#my_dashboard', as: 'dashboard'
end
