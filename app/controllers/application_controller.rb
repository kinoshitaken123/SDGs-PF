class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger

 protected

  def configure_permitted_parameters
      added_attrs = [:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :phone_number, :password]
      devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
      devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

 private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

end
