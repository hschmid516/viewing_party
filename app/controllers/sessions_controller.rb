class SessionsController < ApplicationController

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
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end