Rails.application.routes.draw do
  root 'static_pages#home'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :chatrooms do
    resources :messages
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
