Rails.application.routes.draw do
  get 'chats/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root "homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get "daily_posts" => "users#daily_posts"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "search" => "searches#search"

  resources :groups do
    get "join" => "groups#join"
    resources :event_notices, only: [:new, :create]
    get "event_notices" => "event_notices#sent"
  end

  get 'chat/:id', to: 'chats#show', as: 'chat'
  resources :chats, only: [:create]

end