Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :shoes do
    resources :reviews, only: [:index, :new, :edit, :update, :create, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :shoes, only: [:index]
    end
  end

  # root "shoes#index"
  root 'static_pages#index'
end
