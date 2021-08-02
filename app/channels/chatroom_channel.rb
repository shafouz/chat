class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    puts "subscribed"
    stream_from "ChatroomChannel"
  end

  def my_method(data)
    puts data
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
