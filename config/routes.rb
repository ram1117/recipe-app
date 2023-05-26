Rails.application.routes.draw do
  get 'shopping_list/index'
  get 'recipe_foods/new'
  get 'recipe_foods/update'
  get 'recipe_foods/destroy'

  # get 'user/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users
  root 'users#index'
  resources :users, only: %i[index] do
    resources :foods, only: %i[index show new create destroy]
    resources :recipes, only: %i[index new create show destroy] do
      resources :recipe_foods, only: %i[new create edit update destroy]
    end
    resources :shopping_lists, only: %i[index]
  end
  resources :public_recipes, only: [:index]
end
