Rails.application.routes.draw do
  root 'homes#index'

  constraints Subdomain do
    namespace :admin do
      root 'dashboad#show'
      resources :posts
      resource :dashboard, only: :show
    end
  end
end
