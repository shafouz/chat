class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message:#{params[:message]}"
  end

  def unsubscribed
  end
end
