Rails.application.routes.draw do
  get 'home/top'

  devise_for :users ,controllers: {
        registrations: 'users/registrations'
      }
  resources :users, only: [:index, :edit, :update, :show] do
  	resource :relationships, only: [:create, :destroy]
  	get :favorites, on: :member
  	get :follows, on: :member
  	get :followers, on: :member
  end
  resources :articles do
  	resource :favorites, only: [:create, :destroy]
  	resources :comments
  end
  resources :profiles, only:[:index, :edit,:update,:search,:show]
  # root 'articles#index'
  root to: "home#top"
  get "/registrationresult" => "articles#registrationresult"
  get '/search' => "profiles#search"
  get '/article/search' =>"articles#search"
  # post '/article/search' =>'articles#serchresult'
  # post '/user/search' =>'users#searchresult'
end
