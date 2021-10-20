class MoviesController < ApplicationController
  def index
    if params[:search]
      @movies = MovieFacade.find_movies(params[:search])
      respond_to do |format|
        format.html
        format.js
        format.json { render json: 'movies' }
      end
    elsif params[:top_rated]
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
    @recommendations = MovieFacade.recommendations(@movie.id)
  end
end
