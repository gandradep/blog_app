Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    resources :users, only: %i[index show] do
      resources :posts, only: %i[index show] do
        resources :comments, only: %i[index create]
      end
    end
  end

end
