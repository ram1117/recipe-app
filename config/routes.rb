Rails.application.routes.draw do
  # get 'user/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  resources :users, only: %i[index] do
    resources :foods, only: %i[index show new create destroy]
    resources :recipes, only: %i[index show update destroy]
  end
end
