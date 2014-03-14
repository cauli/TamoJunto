TamoJunto::Application.routes.draw do
  resources :authorizations, only: [:destroy]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations', sessions: 'users/sessions' }
  devise_for :organizations, :controllers => { registrations: 'organizations/registrations', sessions: 'organizations/sessions'}

  root :to => "home#index"

  concern :voteable do
    member do
      get :upvote
      get :downvote
    end
  end

  resources :users, only: :show
  resources :organizations, only: :show
  resources :videos, only: :show
  resources :documents, only: :show
  resources :articles, only: :show, concerns: [:voteable]
  resources :events, only: :show

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :articles, except: :show
    resources :videos, except: :show
    resources :documents, except: :show
    resources :users, except: [:new, :create, :show]
    resources :organizations, except: [:new, :create, :show]
    resources :events, except: [:new, :create, :show] do
      member do
        get :reject
        get :approve
        get :cancel
      end
    end
  end
end
