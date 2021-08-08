class ChatroomUsersChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chatroom:#{params[:chatroom]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
