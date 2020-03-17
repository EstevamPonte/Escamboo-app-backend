class Api::ProductsController < ApplicationController
  before_action :authenticate_with_token!


  def index
    products = current_user.product
    render json: { products: products }, status: 200
  end
end
