class MoviesController < ApplicationController
  def index
    if params[:top_rated]
      @movies = MovieFacade.top_movies
    elsif params[:search]
      @movies = MovieFacade.find_movies(params[:search])
    end
  end

  def show
    @movie = MovieFacade.movie_details(params[:id])
  end
end
