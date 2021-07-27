class Public::UserController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_paramas)
      redirect_to public_user_show_path, success: "内容を登録しました"
    else
      render :edit
    end
  end

  private

  def user_paramas
    params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :phone_numbar)
  end
end
