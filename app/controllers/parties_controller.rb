class PartiesController < ApplicationController
  def new
      @movie = MovieFacade.movie_details(params[:movie_id])
  end

  def create
    #create party and guest
    party = Party.create(party_params)
    party.guests.create(user: current_user, host: true)
    params[:friend_ids].each do |friend_id|
      party.guests.create(user_id: friend_id, host: false)
    end
    redirect_to dashboard_index_path
  end

  private
  def party_params
   params.permit(:duration, :day, :time, :title)
  end
end
