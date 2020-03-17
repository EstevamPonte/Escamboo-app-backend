class Api::ProductsController < ApplicationController
  before_action :authenticate_with_token!


  def index
    products = current_user.products
    render json: { products: products }, status: 200
  end

  def show 
    task = current_user.products.find(params[:id])
    render json: task, status: 200
  end
end
