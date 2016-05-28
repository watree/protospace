Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :users, only: [:show, :edit, :update] do
    resources :prototypes, only: [:index, :new, :show, :create]
  end
end
