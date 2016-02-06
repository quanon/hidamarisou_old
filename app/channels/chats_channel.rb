class ChatsChannel < ApplicationCable::Channel
  def enter(data)
    stop_all_streams
    stream_from("rooms:#{data['room_id'].to_i}:chats")
  end

  def leave
    stop_all_streams
  end
end
