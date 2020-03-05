Rails.application.routes.draw do
  root 'sessions#new'
  get 'login', to: 'sessions#new', as: 'log_in'
  get 'signup', to: 'users#new', as: 'sign_up'
  get 'logout', to: 'sessions#destroy', as: 'log_out'
  resources :sessions, only: [:new, :destroy, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :articles do
    resources :comments
  end
end
