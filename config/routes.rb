Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :shoes do
    resources :reviews, only: [:index, :new, :create, :destroy]
  end

  resources :reviews, only: [:show] do
    resources :votes
  end


  root "shoes#index"
end
