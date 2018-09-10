Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root :to => 'users#index'

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  resources :user_sessions
  resources :password_resets
  resources :users do
    member do
      get :activate
    end
  end
  resources :villages do
    member do
      get :join
    end
  end
  mount ActionCable.server => '/cable'
end
