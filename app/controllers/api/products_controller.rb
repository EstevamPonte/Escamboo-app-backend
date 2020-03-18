class Api::ProductsController < ApplicationController
  before_action :authenticate_with_token!


  def index
    products = current_user.products
    render json: { products: products }, status: 200
  end

  def show 
    products = current_user.products.find(params[:id])
    render json: products, status: 200
  end

  def create
    product = current_user.products.build(product_params)

    if product.save
      render json: product, status: 201
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  def update
    product = current_user.products.find(params[:id])

    if product.update_attributes(product_params)
      render json: product, status: 200
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  def destroy
    product = current_user.products.find(params[:id])
    product.destroy
    head 204
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :escamboos, :category)
  end
end
