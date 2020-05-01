Rails.application.routes.draw do

  resources :favourites
  resources :shows
  devise_for :users

  get 'pages/home'

  root to: "shows#index"

  devise_scope :user do
    get "signup", to: "devise/registrations#new"
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
