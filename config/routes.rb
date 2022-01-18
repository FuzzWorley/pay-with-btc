Rails.application.routes.draw do
  namespace :manager do
    resources :products
    resources :admins
    resources :payment_requests
    resources :stores

    root to: "products#index"
  end

  devise_for :admins

  root 'home#index'
end
