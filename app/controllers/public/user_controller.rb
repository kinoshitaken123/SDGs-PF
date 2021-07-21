class Public::UserController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
       redirect_to public_user_update_path, success: "内容を登録しました"
    else
       render :edit
    end
  end

  private

    def user_paramas
        params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :phone_numbar)
    end
end
