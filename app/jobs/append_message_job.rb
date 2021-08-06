class AppendMessageJob < ApplicationJob
  queue_as :default

  def perform(arg)
    # Do something later
    ActionCable.server.broadcast("chatroom:#{arg}", { body: "appended message" })
  end
end
