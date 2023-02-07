Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :recipes, except: [:update] do
  end

  # Defines the root path route ("/")
  # root "articles#index"

  root "recipes#index"
  end
