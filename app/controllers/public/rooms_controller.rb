class Public::RoomsController < ApplicationController
  before_action :authenticate_user! # Deviseのログイン確認

  def show
     @chats = Chats.all
  end

  def index
  end

end