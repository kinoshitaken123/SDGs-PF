class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_admin!
  add_flash_types :success, :info, :warning, :danger

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

 private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

end
