Rails.application.routes.draw do
  root to: 'audios#index'

  resources :audios, only: [:index,:create]
end
