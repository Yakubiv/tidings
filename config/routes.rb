require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    patch 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  root 'homes#index'

  get '/sitemap.xml' => 'sitemaps#index', defaults: { format: 'xml' }

  resources :posts, only: %i[index show] do
    get 'c/:category', action: :index, on: :collection
  end

  resources :search, only: :index

  resource :about, only: :show
  resources :contacts, only: %i[index create]
  resources :subscriptions, only: :create
  namespace :api do
    resources :posts, only: :index
  end

  constraints Subdomain do
    namespace :admin do
      root 'dashboad#show'
      resources :posts do
        get :autocomplete_tag_name, on: :collection
      end
      resources :contacts, only: %i[index]
      resource :dashboard, only: :show
      resources :users, only: %i[index new create update destroy]
    end
  end
end
