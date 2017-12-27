Rails.application.routes.draw do
  root 'home#index'

  resources :articles
  resources :categories, except: [:destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'  
  resources :users, except: [:new]
end
