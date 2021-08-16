class SessionsController < ApplicationController
  skip_before_action :ensure_authenticated_user, only: %i[ new create ]

  def new
    @user = User.new
  end

  def create
    user = User.where(account_status: 'active').find_by_email(params[:email])
    if user.present? && user.authenticate(params[:password])
      authenticate_user(user.id)
      redirect_to root_path, notice: 'Logged in successfully'
    else
      redirect_to sign_in_path
      flash[:alert] = 'Invalid email or password'
    end
  end

  def destroy
    unauthenticate_user
    redirect_to root_path, notice: 'Logged Out'
  end
end
