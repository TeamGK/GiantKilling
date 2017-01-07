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
  resources :profiles
  root 'articles#index'
  get "/registrationresult" => "articles#registrationresult"
  
  get '/article/search' =>"articles#search"
  post '/article/search' =>'articles#serchresult'
  post '/user/search' =>'users#searchresult'
end
