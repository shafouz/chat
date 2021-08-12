class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom:#{chatroom}"
    set_online_or_create
  end

  def unsubscribed
    set_offline
  end

  def set_online_or_create
    SetStatusJob.perform_now(chatroom_user, true)
  end

  def set_offline
    SetStatusJob.perform_now(chatroom_user, false)
  end

  private

  def chatroom_user
    @chatroom_user = Chatroom.find_by_id(params[:chatroom])
      .chatroom_users
      .where(user_id: current_user).first_or_create
  end

  def chatroom
    @chatroom = params[:chatroom]
  end
end
