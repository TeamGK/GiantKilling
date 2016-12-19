Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update, :show] do
  	resource :relationships, only: [:create, :destroy]
  	get :favorites, on: :member
  	get :follows, on: :member
  	get :followers, on: :member
  end
  resources :articles do
  	resource :favorites, only: [:create, :destroy]
  	resource :comments
  end
  resource :profiles
  root 'articles#index'
  get "/registrationresult" => "articles#registrationresult"
end
