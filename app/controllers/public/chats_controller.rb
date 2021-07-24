class Public::ChatsController < ApplicationController

  before_action :authenticate_user!

 def show
   @user = User.find(params[:id])
  #user_roomsテーブルのuser_idがAさんのレコードのroom_idを配列で取得
   rooms = current_user.user_rooms.pluck(:room_id)
  #user_idがBさん(@user)で、room_idがAさんの属するroom_id（配列）となるuser_roomsテーブルのレコードを取得して、user_room変数に格納
  #これによって、AさんとBさんに共通のroom_idが存在していれば、その共通のroom_idとBさんのuser_idがuser_room変数に格納される（1レコード）。存在しなければ、nilになる。
   user_room = UserRoom.find_by(user_id: @user.id, room_id: rooms)
  #user_roomでルームを取得できなかった（AさんとBさんのチャットがまだ存在しない）場合の処理
   room = nil
   if user_room.nil?
   #roomのidを採番
    room = Room.new
    room.save
    #採番したroomのidを使って、user_roomのレコードを2人分（Aさん用、Ｂさん用）作る（＝AさんとBさんに共通のroom_idを作る）
    #Bさんの@user.idをuser_idとして、room.idをroom_idとして、UserRoomモデルのがラムに保存（1レコード）
     UserRoom.create(user_id: @user.id, room_id: room.id)
    #Aさんのcurrent_user.idをuser_idとして、room.idをroom_idとして、UserRoomモデルのカラムに保存（1レコード）
     UserRoom.create(user_id: current_user.id, room_id: room.id)
   else
    #user_roomに紐づくroomsテーブルのレコードをroomに格納
     room = user_room.room
   end
   #roomに紐づくchatsテーブルのレコードを@chatsに格納
    @chats = room.chats
   #form_withでチャットを送信する際に必要な空のインスタンス
   #ここでroom.idを@chatに代入しておかないと、form_withで記述するroom_idに値が渡らない
    @chat = Chat.new(room_id: room.id)
 end

  def create
    filtered_params = chat_params
    @chat = Chat.new(filtered_params)
    room = Chat.find_by_room_id(filtered_params["room_id"])
    @chat.admin_id = room.admin_id if room
    @chat.save
    redirect_to public_room_path(@chat.room_id)
  end

  private

  def chat_params
    #byebug
    params.require(:chat).permit(:message, :room_id, :user_id).merge(user_id: current_user.id, is_user_sent: true)

  end

end