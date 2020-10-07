Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'

  resources :boards do
    resources :comments, only: [:new, :create]
    
    resource :like, only: [:create, :destroy]

   
  end
  resource :profile, only: [:show, :edit, :update]
  #indexは複数を表示するものだからrouteは作られない

end