class ChatroomChannel < ApplicationCable::Channel

  # maybe change online/offline to a job
  def subscribed
    stream_from "chatroom:#{params[:chatroom]}"
    chatroom.chatroom_users.where(user_id: current_user)[0].update(status: true)
  end

  def unsubscribed
    chatroom.chatroom_users.where(user_id: current_user)[0].update(status: false)
  end

  private

  def chatroom
    @chatroom = Chatroom.find_by_id(params[:chatroom])
  end
end
