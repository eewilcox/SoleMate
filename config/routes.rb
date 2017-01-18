Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  before_action :authenticate_user!, except: [:index]
  resources :shoes, only: [:index]

  root "shoes#index"
end
