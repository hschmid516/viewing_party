class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user
      flash[:warning] = "You must be logged in to access this page! Access denied!"
      redirect_to root_path
    end
  end
end
