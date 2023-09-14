# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end
  root to: 'items#index'
  resources :items
  resources :receipts, only: %i[index show create]
  get '/carts' => 'carts#index'
  post '/add_item' => 'carts#create'
  delete '/delete_item' => 'carts#destroy'
  post '/checkout' => 'checkouts#create'
  # resources :receipt, only: [:index,:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
