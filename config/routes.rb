Rails.application.routes.draw do
  devise_for :users

  resources :shoes do
    resources :reviews, only: [:index, :new, :edit, :update, :create, :destroy] do
    end
  end

  resources :reviews, only: [:show] do
    resources :votes, only: [:index, :new, :edit, :update, :create]
  end

  resources :users, only: [:index, :destroy]

  namespace :api do
    namespace :v1 do
      resources :shoes, only: [:index]
      resources :reviews, only: [:index] do
      resources :votes, only: [:index, :create, :update, :show]
    end
    end
  end

  root 'static_pages#index'
end
