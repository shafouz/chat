class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    @chatroom = Chatroom.find_by_id(params[:chatroom])
    stream_from @chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
