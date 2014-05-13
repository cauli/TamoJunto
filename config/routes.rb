TamoJunto::Application.routes.draw do
  resources :authorizations, only: [:destroy]

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks",
                                       registrations: 'users/registrations',
                                       sessions: 'users/sessions',
                                       passwords: 'users/passwords' }

  devise_for :organizations, :controllers => { registrations: 'organizations/registrations',
                                               sessions: 'organizations/sessions',
                                               passwords: 'organizations/passwords' }

  root :to => "home#index"

  get :search, to: 'search#index', as: :search
  post :search, to: 'search#index'

  concern :voteable do
    member do
      get :upvote
      get :downvote
    end
  end

  resources :users, only: :show
  resources :organizations, only: :show
  resources :articles, only: :show, concerns: [:voteable]
  resources :videos, only: :show, concerns: [:voteable]
  resources :documents, only: :show, concerns: [:voteable]
  resources :events, except: :index
  resources :services, except: :index
  resources :topics, only: :show
  resources :diagnostics, except: [:edit, :destroy] do
    get :questions
    resources :answers
  end

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :articles, except: :show
    resources :videos, except: :show
    resources :documents, except: :show
    resources :users, except: [:new, :create, :show]
    resources :organizations, except: [:new, :create, :show]
    resources :themes, except: :show
    resources :topics, except: :show
    resources :questions, except: :show
    resources :events, except: [:new, :create, :show] do
      member do
        get :reject
        get :approve
        get :cancel
      end
    end
    resources :services, except: [:new, :create, :show] do
      member do
        get :reject
        get :approve
      end
    end
    resources :tags, only: [:index, :destroy]
    namespace :reports do
      resources :users, only: :index
      resources :organizations, only: :index
    end
  end
end
