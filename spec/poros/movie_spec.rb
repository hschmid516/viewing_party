require 'rails_helper'

describe Movie do
  it 'has attributes' do
    movie = Movie.new(movie_data)

    expect(movie.id).to eq(238)
    expect(movie.title).to eq('The Godfather')
    expect(movie.vote_average).to eq(8.7)
  end
end
