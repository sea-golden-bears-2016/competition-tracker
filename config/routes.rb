Rails.application.routes.draw do
  resource :leagues, only: [:index]

  root 'leagues#index'
end
