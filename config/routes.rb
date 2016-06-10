Rails.application.routes.draw do
  root 'posts#index'
  resources :users

  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  get '/followed', to: "posts#follow_index"

  resources :comments, only: [] do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  patch '/comments/:id', to: 'comments#update', as: 'comment'

  resources :sessions, only: [:create]
  get '/login', to: "sessions#new"
  delete '/logout', to: "sessions#destroy"

  post '/follow', to: "followers#create"
  delete '/unfollow', to: "followers#destroy"
end
