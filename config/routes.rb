TamoJunto::Application.routes.draw do
  resources :authorizations, only: [:destroy]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations', sessions: 'users/sessions' }
  devise_for :organizations, :controllers => { registrations: 'organizations/registrations', sessions: 'organizations/sessions'}

  root :to => "home#index"

  resources :users, only: :show
  resources :organizations, only: :show
  resources :articles, only: :show
  resources :videos, only: :show
  resources :documents, only: :show

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :articles, except: :show
    resources :videos, except: :show
    resources :documents, except: :show
    resources :users, except: [:new, :create, :show]
    resources :organizations, except: [:new, :create, :show]
  end
end
