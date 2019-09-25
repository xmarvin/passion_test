Rails.application.routes.draw do
  root to: 'home#index'
  resources :verticals, only: [:index]
  resources :categories, only: [:index]
  resources :courses, only: [:index]
end
