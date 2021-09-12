Rails.application.routes.draw do
  devise_for :users
  root to: 'users#new'

  resources :users, only: [:show, :get] do
    member do
      get 'show'
    end
  end

  resources :inputs, only: [:show, :get]

  resources :spendings, only: [:new, :create]

  resources :incomes, only: [:new, :create]

  resources :histories, only: [:show, :get]

end
