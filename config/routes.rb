Rails.application.routes.draw do
  resources :messages, only: [:index,:new,:create]
  get "/home", to: "messages#home", as: "home"
  devise_for :clients
  root to: 'messages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
