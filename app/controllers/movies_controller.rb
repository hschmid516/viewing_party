class MoviesController < ApplicationController
  def index
    if params[:search]
      @movies = MovieFacade.find_movies(params[:search])
      respond_to do |format|
        format.html
        format.js
        format.json { render json: 'movies' }
      end
    else
      @movies = MovieFacade.top_movies
      respond_to do |format|
        format.html
        format.js
        format.json { render json: 'movies' }
      end
    end
  end

  def show
    @movie = MovieFacade.movie_details(params[:id])
    @backdrop = MovieFacade.backdrop(@movie.id)
  end
end
