class ChatroomChannel < ApplicationCable::Channel
  # maybe change online/offline to a job
  def subscribed
    stop_all_streams
    stream_from "chatroom:#{chatroom}"
    set_online
  end

  def unsubscribed
    set_offline
    stop_all_streams
  end

  def set_online
    broadcast_to chatroom, status: { user: ActionView::RecordIdentifier.dom_id(chatroom_user), status: true }
    SetStatusJob.perform_now(chatroom_user.id, true)
  end

  def set_offline
    broadcast_to chatroom, status: { user: ActionView::RecordIdentifier.dom_id(chatroom_user), status: false }
    SetStatusJob.perform_now(chatroom_user.id, false)
  end

  private

  def chatroom_user
    @chatroom_user = Chatroom.find_by_id(params[:chatroom]).chatroom_users.where(user_id: current_user)[0]
  end

  def chatroom
    @chatroom = params[:chatroom]
  end
end
