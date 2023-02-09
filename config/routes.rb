Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :recipes do
    resources :recipe_foods, as: 'foods'
  end
  resources :public_recipes  
  post 'toggle_public', to: 'recipes#toggle'


  resources :foods

  # Defines the root path route ("/")
  # root "articles#index"

  root "recipes#index"
  end
