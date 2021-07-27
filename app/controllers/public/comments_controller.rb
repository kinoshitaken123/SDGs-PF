class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(comment_params[:product_id])
    @products_comment = ProductsComment.new(comment_params)
    @products_comment.user_id = current_user.id
    @products_comment.save
    @new_comment = ProductsComment.new
  end

  def destroy
    @products_comment = ProductsComment.find(params[:id])
    @product = @products_comment.product
    # @product = Product.find(params[:id])
    # products_comment = @product.products_comments.find(params[:id])
    @products_comment.destroy
  end

  private

  def comment_params
    params.require(:products_comment).permit(:comment, :product_id)
  end
end
