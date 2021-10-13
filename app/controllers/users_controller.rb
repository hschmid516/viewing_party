class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    flash[:success] = "Welcome, #{new_user.name}!"
    redirect_to dashboard_index_path
  end

  def login
    user = User.find_by(email: params[:email])
    flash[:success] = "Welcome, #{user.name}!"
    redirect_to dashboard_index_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
