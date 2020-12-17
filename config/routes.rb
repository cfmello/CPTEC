Rails.application.routes.draw do
  # devise_for :users
  root to: 'pages#home'
  get "/about", to: 'pages#about'
  get "/guidance", to: 'pages#guidance'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :experts, only: %i[edit update index show] do
    resources :fields, only: %i[create update]
    resources :investigations, only: %i[new create]
  end
  resources :fields, only: :destroy
  resources :investigations, only: %i[update show index]
end
