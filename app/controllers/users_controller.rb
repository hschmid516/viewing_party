class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.name}!"
    end
    redirect_to dashboard_index_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
