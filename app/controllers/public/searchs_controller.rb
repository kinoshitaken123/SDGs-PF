class Public::SearchsController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @genres = []
    @products = []
    if @range == "Genre"
      @genres = Genre.looks(params[:search], params[:word])
    else
      @products = Product.looks(params[:search], params[:word])
    end
    if @genres.empty? && @products.empty?
      @range = 'not hit'
    end
  end
end
