class UserBaseController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about, :product]
end
