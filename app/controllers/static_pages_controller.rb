class StaticPagesController < ApplicationController
  skip_before_action :ensure_authenticated_user

  def home
  end
end
