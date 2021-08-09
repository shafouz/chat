class StatusJob < ApplicationJob
  queue_as :default

  def perform(arg)
  end
end
