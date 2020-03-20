class Api::LikesController < ApplicationController
  before_action :authenticate_with_token!

  def create
    
    productId = Product.find_by(id: like_params[:product])
    like = Like.new({user: current_user, product: productId})
    if like.save
      render json: like, status: 200
    else
      render json: { errors: like.errors }, status: 422
    end
  end

  def index
    # likes = Like.all
    # allLikes = []
    likes = Like.where(product_id: current_user.products)
    
    # likes.each { |a|
    #   if current_user.products.find_by(id: a.product_id)
    #     allLikes.push(a)
    #   end
    # }
    # oderlikes = likes.find_by(product_id: current_user.products)
    # myLikes = current_user.likes
    render json: likes, status: 200
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy
    head 204
  end


  private

  def like_params
    params.require(:like).permit(:product)
  end
end
