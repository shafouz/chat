class SetStatusJob < ApplicationJob
  queue_as :default

  def perform(chatroom_user, status)
    if status == true
      chatroom_user.update(status: true)
      ChatroomChannel.broadcast_to chatroom_user.chatroom.id, chatroom:
        { username: ApplicationController.renderer.render_to_string(partial: 'chatrooms/chatroom_user',
                                                                    locals: { chatroom_user: chatroom_user }),
          userId: ActionView::RecordIdentifier.dom_id(chatroom_user),
          status: true }
    else
      chatroom_user.update(status: false)
      ChatroomChannel.broadcast_to chatroom_user.chatroom.id, chatroom:
        { userId: ActionView::RecordIdentifier.dom_id(chatroom_user),
          status: false }
    end
  end
end
