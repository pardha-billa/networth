Rails.application.routes.draw do
  namespace :admin do
      resources :funds
      resources :members
      resources :transactions
      root to: "funds#index"
    end
  resources :funds
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
