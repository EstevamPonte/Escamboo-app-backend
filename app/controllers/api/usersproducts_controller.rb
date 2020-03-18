class Api::UsersproductsController < ApplicationController
  def index
    allUser = User.all
    all = []
    allUser.each { |a| 
      all.push({user: allUser.find(a.id), product: a.products})
    }
    render json: {all: all }, status: 200
  end

  def show
    userProduct = User.find(params[:id])
    render json: {user: userProduct, product: userProduct.products}, status: 200
  end
end
