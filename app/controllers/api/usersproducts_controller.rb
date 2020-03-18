class Api::UsersproductsController < ApplicationController
  def index
    allProduct = Product.all
    allUser = User.all
    all = []
    allUser.each { |a| 
      all.push({user: allUser.find(a.id), product: a.products})
    }
    render json: {all: all }, status: 200
  end
end
