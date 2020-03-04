Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions, only: [:new, :destroy, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :articles do
    resources :comments
  end
end
