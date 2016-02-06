class ChatsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @chat = Chat.create!(body: chat_params[:body], room: @room)

    ActionCable.server.broadcast(
      "rooms:#{@chat.room_id}:chats",
      chat: ChatsController.render(partial: 'chats/chat', locals: { chat: @chat })
    )

    head(:created)
  end

  private

  def chat_params
    params.require(:chat).permit(:body)
  end
end
