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

  constraints Subdomain do
    namespace :admin do
      root 'dashboad#show'
      resources :posts do
        get :autocomplete_tag_name, on: :collection
      end
      resource :dashboard, only: :show
    end
  end
end
