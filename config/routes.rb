Rails.application.routes.draw do
  # devise_for :users
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :experts, only: %i[edit update index show] do
    resources :fields, only: %i[create update]
  end
  resources :fields, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/:page" => "static#show"
end
