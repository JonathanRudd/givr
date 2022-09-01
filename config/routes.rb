Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :pickups, only: [:new, :create]
    resources :comments, only: [ :new, :create, :edit, :update, :destroy ]
    resources :reviews, only: [:create]
  end
  resources :pickups, only: [:index, :show, :update, :destroy] do
    resources :messages
  end

  # get 'giveaways', to: 'items#my_items', as: 'giveaways'

  get 'dashboard', to: 'pages#my_dashboard', as: 'dashboard'

  get 'notification', to: 'notifications#update_seen_redirect', as: 'notification'
end
