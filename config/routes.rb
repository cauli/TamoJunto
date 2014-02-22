TamoJunto::Application.routes.draw do
  resources :authorizations, only: [:destroy]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations', sessions: 'users/sessions' }
  devise_for :organizations, :controllers => { registrations: 'organizations/registrations', sessions: 'organizations/sessions'}

  root :to => "home#index"

  resources :users, only: :show
  resources :articles, only: :show

  namespace :admin do
    get '/', to: 'dashboard#index'
  end
end
