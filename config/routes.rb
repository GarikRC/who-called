Rails.application.routes.draw do

  root :to => "phone_numbers#index"

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  resources :phone_numbers do
    resources :testimonies do
      resources :confirmations
    end
  end

end
