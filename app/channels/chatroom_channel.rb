class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom:#{params[:chatroom]}"
  end

  def set_online
    #Chatroom.find_by_id(params[:chatroom]).chatroom_users.where(user: current_user)[0].update(status: true)
  end

  def set_offline(data)
    #Chatroom.find_by_id(data['id']).chatroom_users.where(user: current_user)[0].update(status: false)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
