class WebSocketController < ApplicationController
  def new
    render plain: WebSocketApp.new.ping
  end
end
