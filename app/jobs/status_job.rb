class StatusJob < ApplicationJob
  queue_as :default

  def perform(user_id:, chatroom_id:)
  end
end
