module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :ensure_authenticated_user
  end

  private

  def ensure_authenticated_user
    authenticate_user(session[:user_id]) || redirect_to(sign_in_path, notice: 'You must be logged in to do that.')
  end

  def authenticate_user(user_id)
    if authenticated_user = User.find_by(id: user_id)
      session[:user_id] ||= user_id
      @current_user = authenticated_user
    end
  end

  def unauthenticate_user
    @current_user = nil
    session[:user_id] = nil
  end
end