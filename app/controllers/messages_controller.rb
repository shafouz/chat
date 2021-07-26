class MessagesController < ApplicationController
  def new
    @user = current_user
    @chatroom = params[:chatroom_id]
    @message = Message.new(user_id: @user, chatroom_id: @chatroom)
  end

  def create
    @message = Message.create(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:text, message_attributes: [:user_id, :chatroom_id])
  end

end
