class UsersController < ApplicationController
  skip_before_action :require_user

  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.name}!"
      redirect_to dashboard_index_path
    else
      flash[:error] = 'Email is taken, or password is invalid. Try again'
      redirect_to registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
