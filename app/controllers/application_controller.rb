class ApplicationController < ActionController::Base
  include Authentication
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.where(account_status: 'active').find_by_id(session[:user_id])
  end
end
