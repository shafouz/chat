module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :ensure_authenticated_user
  end

  private

  def ensure_authenticated_user
    authenticate_user(session[:user_id]) || redirect_to(sign_in_path, alert: 'You must be logged in to do that.')
  end

  def authenticate_user(user_id)
    session[:user_id] ||= user_id
    @current_user = User.where(account_status: 'active').find_by_id(user_id)
  end

  def unauthenticate_user
    session[:user_id] = nil
    @current_user = nil
  end
end
