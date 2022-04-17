Rails.application.routes.draw do
  devise_for :users
  root to: 'users#new'
  root "users#show"

  resources :users, only: [:show, :get] do
    member do
      get 'show'
    end
  end

  resources :inputs, only: [:show, :get] do
    collection do
      get 'calendar'
    end
  end

  resources :spendings, only: [:new, :create, :edit, :update, :destroy]

  resources :incomes, only: [:new, :create, :edit, :update, :destroy]

  resources :histories, only: [:show, :get]

  resources :analyses, only: [:show, :get, :index] do
    collection do
      get 'search'
    end
  end

end
