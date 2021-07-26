class ApplicationController < ActionController::Base
  include Authentication

  helper_method :current_user

  private

  def current_user
    @current_user ||= session[:user_id]
  end
end
