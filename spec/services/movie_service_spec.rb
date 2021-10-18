require 'rails_helper'

describe MovieService, :vcr do
  it 'can get top movies' do
    movie_data = MovieService.top_movies

    expect(movie_data).to be_a Array
    expect(movie_data.first).to be_a Hash
    expect(movie_data.first[:id]).to be_a Integer
    expect(movie_data.first[:title]).to be_a String
    expect(movie_data.first[:vote_average]).to be_a Float
  end

  it 'can get cast names and characters' do
    response = MovieService.cast(17473)

    expect(response).to be_a Hash
    expect(response[:cast]).to be_a Array

    cast_data = response[:cast]

    expect(cast_data.first).to be_a Hash
    expect(cast_data.first[:name]).to be_a String
    expect(cast_data.first[:character]).to be_a String
  end

  it 'can get reviews for a movie' do
    response = MovieService.reviews(17473)

    expect(response).to be_a Hash
    expect(response[:results]).to be_a Array
    expect(response[:total_results]).to be_a Integer

    review_data = response[:results]

    expect(review_data.first).to be_a Hash
    expect(review_data.first[:author]).to be_a String
    expect(review_data.first[:content]).to be_a String
  end

  it 'can search for movies' do
    movie_data = MovieService.search_results('The Godfather')

    expect(movie_data).to be_a Array
    expect(movie_data.first).to be_a Hash
    expect(movie_data.first[:id]).to be_a Integer
    expect(movie_data.first[:title]).to be_a String
    expect(movie_data.first[:vote_average]).to be_a Float
  end
end
