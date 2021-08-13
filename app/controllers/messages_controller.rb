class MessagesController < ApplicationController
  before_action :set_chatroom

  def create
    message = @chatroom.messages.create(message_params)
    MessageChannel.broadcast_to @chatroom.id, message: render_to_string(message)
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:text).merge(user: current_user)
  end
end
