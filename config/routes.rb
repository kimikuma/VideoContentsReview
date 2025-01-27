Rails.application.routes.draw do
  devise_for :admin_users, path: "admin", skip: [ :registation], controllers: {
    sessions: "admin/sessions",
    passwords: "admin/passwords"
  }

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    passwords: "public/passwords"
  }

  namespace :admin do
    resources :users, only: [ :show, :edit, :update, :index, :destroy ]
    resources :posts, except: [ :new, :create ] do
      resources :comments, only: [:destroy]
    end   
    resources :genres, only: [:index, :create, :update, :destroy, :edit]
    resources :vods, only: [:create, :update, :destroy, :edit]
    resources :tags, only: [:edit, :update, :destroy, :create]
    get "/searches" => "searches#search"
    get "/searches/tag_genre_vod" => "searches#search_tag_genre_vod"
  end

  scope module: :public do
    root "homes#top"
    get "/mypage" => "users#mypage"
    resources :users, only: [ :edit, :update, :show, :destroy ]
    get "/confirm" => "users#confirm"
    resources :posts do
      resources :comments, only: [ :create, :destroy]
    end 
    resources :notifications, only: [ :update]
    get "/searches" => "searches#search"

    devise_scope :user do
      post "users/guest_sign_in" => "sessions#guest_sign_in"
    end
    resources :tags, only: [:index]
    get "/search_tag" => "tags#search_tag", as: "search_tag"
    get "/search_vod" => "vods#search_vod", as: "search_vod"
    get "/search_genre" =>"genres#search_genre", as: "search_genre"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end  