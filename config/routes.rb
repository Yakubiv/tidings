Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'homes#index'

  resources :posts, only: %i[index show] do
    get 'c/:category', action: :index, on: :collection
  end
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
    end
  end
end
