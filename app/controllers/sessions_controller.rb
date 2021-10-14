class SessionsController < ApplicationController
  skip_before_action :require_user
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to dashboard_index_path
    else
      flash[:error] = "Sorry, your credentials are bad. Pitter Patter let's get at er"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
