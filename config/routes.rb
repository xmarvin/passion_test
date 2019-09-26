Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  root to: 'home#index'
  resources :verticals, only: [:index]
  resources :categories, only: [:index]
  resources :courses, only: [:index]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
