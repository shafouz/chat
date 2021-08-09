class ChatroomChannel < ApplicationCable::Channel

  # maybe change online/offline to a job
  def subscribed
    stream_from "chatroom:#{chatroom}"
    chatroom_user.update(status: true)
    broadcast_to chatroom, status: { user: ActionView::RecordIdentifier.dom_id(chatroom_user), status: true }
  end

  def unsubscribed
    chatroom_user.update(status: false)
    broadcast_to chatroom, status: { user: ActionView::RecordIdentifier.dom_id(chatroom_user), status: false }
  end

  private

  def chatroom_user
    @chatroom_user = Chatroom.find_by_id(params[:chatroom]).chatroom_users.where(user_id: current_user)[0]
  end

  def chatroom
    @chatroom = params[:chatroom]
  end
end
