require 'api_version_constraint'
Rails.application.routes.draw do
  devise_for :users, only: [:sessions], controllers: {sessions:'api/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'api/users#index'

  namespace :api, defaults: { format: :json }, constraints: ApiVersionConstraint.new(), path: '/' do
    resources :users, only: [:show, :create, :update, :destroy, :index]
    resources :sessions, only: [:create, :destroy]
    resources :products, only: [:index, :show, :create, :update, :destroy]
    resources :usersproducts, only: [:index, :show]
    resources :likes, only: [:index, :create, :destroy]
  end
end
