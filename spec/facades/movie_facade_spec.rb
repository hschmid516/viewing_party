require 'rails_helper'

describe MovieFacade, :vcr do
  it '#top_movies returns top movies' do
    top_movies = MovieFacade.top_movies

    expect(top_movies.first).to be_a Movie
    expect(top_movies.first.id).to eq(19404)
  end

  it '#find_movies returns top movies' do
    movies = MovieFacade.find_movies('The Godfather')

    expect(movies.first).to be_a Movie
    expect(movies.first.id).to eq(238)
  end

  it '#movie_details returns a movie with details' do
    movie = MovieFacade.movie_details(238)

    expect(movie).to be_a MovieDetail
    expect(movie.id).to eq(238)
  end
end
