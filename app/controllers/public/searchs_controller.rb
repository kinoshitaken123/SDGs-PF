class Public::SearchsController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "Genle"
      @genles = Genre.looks(params[:search], params[:word])
    else
      @products = Product.looks(params[:search], params[:word])
    end
  end
end
