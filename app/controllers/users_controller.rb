class UsersController < ApplicationController

  def login
    user = User.find_by(email: params[:email])
    flash[:success] = "Welcome, #{user.name}!"
    redirect_to dashboard_index_path
  end
end
