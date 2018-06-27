Rails.application.routes.draw do
  root 'homes#index'

  namespace :admin do
    resources :posts
    resource :dashboard, only: :show
  end
end
