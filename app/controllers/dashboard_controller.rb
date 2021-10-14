class DashboardController < ApplicationController
  before_action :require_user

  def require_user
    unless current_user
      flash[:warning] = "You must be logged in to access this page! Access denied!"
      redirect_to root_path
    end
  end

  def index
    @user = current_user
  end
end
