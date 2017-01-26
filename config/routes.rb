Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#index'

  namespace :api do
    namespace :v1 do
      resources :shoes, only: [:index]
    end
  end

  resources :shoes do
    resources :reviews, only: [:new, :edit, :update, :create, :destroy] do
    end
  end

  resources :users, only: [:index, :destroy]

  namespace :api do
    namespace :v1 do
      resources :shoes, only: [:index]
      resources :reviews, only: [:index] do
        resources :votes, only: [:index, :create]
      end
    end
  end


end
