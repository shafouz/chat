class SetStatusJob < ApplicationJob
  queue_as :default

  def perform(chatroom_user_id, status)
    chatroom_user = ChatroomUser.find_by_id(chatroom_user_id)
    sleep 1
    if status == true
      chatroom_user.update(status: true)
    else
      chatroom_user.update(status: false)
    end
  end
end
