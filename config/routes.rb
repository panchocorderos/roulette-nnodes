Rails.application.routes.draw do
  resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "round#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
