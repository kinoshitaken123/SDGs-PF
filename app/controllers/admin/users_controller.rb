class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:success] = "会員情報を変更しました"
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  private

   def user_params
     params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :phone_number)
   end
end