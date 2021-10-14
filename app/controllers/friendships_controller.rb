class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    if friend
      current_user.friendships.create(friend: friend)
    else
      flash[:error] = "Your 'friend' gave you the wrong email...try again"
    end
    redirect_to dashboard_index_path
  end
end
