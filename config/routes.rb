require 'api_version_constraint'
Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json }, constraints: ApiVersionConstraint.new(), path: '/' do
    resources :users, only: [:show]
  end
end