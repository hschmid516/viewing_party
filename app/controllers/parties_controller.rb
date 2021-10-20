class PartiesController < ApplicationController
  def new
    @party = Party.new
    @movie = MovieFacade.movie_details(params[:movie_id])
  end

  def create
    party = Party.new(party_params)
    if party.save
      party.guests.create(user: current_user, host: true)
      params[:friend_ids].each do |friend_id|
        party.guests.create(user_id: friend_id, host: false)
      end
      flash[:notices] = 'Party Created Successfully!'
      redirect_to dashboard_index_path
    else
      flash[:danger] = 'Gotta fill out all fields. Hard no'
      redirect_to new_party_path
    end
  end

  private

  def party_params
    params.permit(:duration, :day, :time, :title)
  end
end
