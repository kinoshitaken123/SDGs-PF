class Public::GenreController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end
end
