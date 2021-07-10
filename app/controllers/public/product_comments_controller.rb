class Public::ProductCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
     @product = Product.find(params[:product_id])
     @product_comment =  Product.new(product_comment_params)
     @product_comment.product_id = @product.id
     @product_comment.user_id = current_user.id
     if @product_comment.save
       redirect_to public_products_path(@product.id)
     else
       render 'productss/show'
     end
  end

  def destroy
     @product = Product.find(params[:product_id])
     product_comment = @Product.product_comments.find(params[:id])
     product_comment.destroy
#   redirect_to public_products_path(@product.id)
  end

  private

  def product_comment_params
      params.require(:product_comment).permit(:comment)
  end

end
