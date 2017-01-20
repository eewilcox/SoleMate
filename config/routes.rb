Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :shoes do
    resources :reviews, only: [:index, :new, :edit, :update, :create, :destroy]
  end


  root "shoes#index"
end
