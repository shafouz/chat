class SessionsController < ApplicationController
  skip_before_action :ensure_authenticated_user, only: %i[ new create ]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    authenticate_user(@user.id)
    redirect_to root_path, notice: 'Logged in successfully'
  end

  def destroy
    unauthenticate_user
    redirect_to root_path, notice: 'Logged Out'
  end
end
