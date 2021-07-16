class Admin::StoresController < ApplicationController
   before_action :authenticate_admin!

  def index
    @stores = Store.all
    @store = Store.new
  end

  def create
     @store = Store.new(store_params)
  if @store.save
    redirect_to admin_stores_path, notice: 'You have created Store successfully.'
  else
    @stores = Store.all
    flash.now[:danger] = 'Store name is necessary!'
    render 'index'
  end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
  if @store.update(store_params)
    redirect_to admin_store_path, notice: 'You have updated Store successfully.'
  else
    flash.now[:danger] = 'Store name is necessary!'
    render 'edit'
  end
  end

  private


  def genre_params
    params.require(:store).permit(:name)
  end

end
