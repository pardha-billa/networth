Rails.application.routes.draw do
  namespace :admin do
      resources :members
      resources :funds
      resources :transactions
      resources :fixed_assets
      root to: "members#index"
    end
  resources :funds
  resources :retirement_portfolio
  root to: 'retirement_portfolio#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
