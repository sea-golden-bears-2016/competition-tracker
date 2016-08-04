Rails.application.routes.draw do
  resource :leagues, only: [:index]

  root 'leagues#index'

  namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resource :dashboard, only: [:show]
    resources :leagues, only: [:show, :update]
  end
end
