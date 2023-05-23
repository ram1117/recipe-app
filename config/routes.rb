Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # resources :foods, only: [:index, :new, :create, :destroy] do
  #   delete ":id", to: "foods#destroy", on: :member
  # end
  #devise_for :users
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  root "foods#index"
end
