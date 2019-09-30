Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  get 'hello_world', to: 'hello_world#index'
  root to: 'home#index'
  resources :verticals, only: [:index]
  resources :categories, only: [:index]
  resources :courses, only: [:index]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
