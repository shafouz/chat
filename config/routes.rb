Rails.application.routes.draw do
  root 'static_pages#home'

  get 'messages/new'
  post 'messages/create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :chatrooms
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
