class DashboardController < ApplicationController
  before_action :require_user

  def require_user
    unless current_user
      flash[:warning] = "You must be logged in to access this page! Access denied!"
      redirect_to root_path
    end
  end

  def index
    @friends = current_user.friends
    if params[:search]
      new_friend = User.find_by(email: params[:search])
      current_user.friendships.create(friend: new_friend)
      redirect_to dashboard_index_path
    end
  end
end
