class MoviesController < ApplicationController
  def index
    if params[:top_rated]
      movie_data = MovieService.top_40
      @movies = movie_data.map do |movie_info|
        Movie.new(movie_info)
      end
    elsif params[:search]

      movie_data = MovieService.top_40_searched(params[:search])
      @movies = movie_data.map do |movie_info|
        Movie.new(movie_info)
      end
    end
  end
end
