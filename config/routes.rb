Rails.application.routes.draw do
  root 'static_pages#home'

  get 'messages/new'
  post 'messages/create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :chatrooms
  resources :users

  # web socket port
  mount WebSocketApp, at: '/web_socket'
end
