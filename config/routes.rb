Rails.application.routes.draw do
  devise_for :users

  resources :shoes do
    resources :reviews, only: [:index, :new, :edit, :update, :create, :destroy]
  end

  resources :users, only: [:index, :destroy]

  namespace :api do
    namespace :v1 do
      resources :shoes, only: [:index]
    end
  end

  root 'static_pages#index'
end
