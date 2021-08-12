class SetStatusJob < ApplicationJob
  queue_as :default

  def perform(chatroom_user, status)
    if status == true
      chatroom_user.update(status: true)
      ChatroomChannel.broadcast_to chatroom_user.chatroom.id, chatroom:
        { username: chatroom_user.user.name,
          user: ActionView::RecordIdentifier.dom_id(chatroom_user),
          status: true }
    else
      chatroom_user.update(status: false)
      ChatroomChannel.broadcast_to chatroom_user.chatroom.id, chatroom:
        { user: ActionView::RecordIdentifier.dom_id(chatroom_user),
          status: false }
    end
  end
end
