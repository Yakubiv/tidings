Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'homes#index'

  resources :posts, only: %i[index show]

  constraints Subdomain do
    namespace :admin do
      root 'dashboad#show'
      resources :posts
      resource :dashboard, only: :show
    end
  end
end
