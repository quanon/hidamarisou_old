class ChatsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @chat = Chat.create!(body: chat_params[:body], room: @room)
  end

  private

  def chat_params
    params.require(:chat).permit(:body)
  end
end
