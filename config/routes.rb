TamoJunto::Application.routes.draw do
  resources :authorizations, only: [:destroy]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }

  root :to => "home#index"

  resources :users, only: :show

  namespace :admin do
    get '/', to: 'dashboard#index'
  end
end
