require 'rails_helper'

RSpec.describe 'movie index page', :vcr do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit movies_path
  end

  it 'it has a top 40 movie button' do
    movie_data = MovieService.top_movies
    movies = movie_data.map do |movie_info|
      Movie.new(movie_info)
    end

    click_on 'Find Top Rated Movies'

    expect(current_path).to eq(movies_path)
    expect(movies.length).to eq(40)
    expect(page).to have_content(movies.first.title)
    expect(page).to have_content(movies.first.vote_average)
    expect(page).to have_content(movies.last.title)
    expect(page).to have_content(movies.last.vote_average)
  end

  it 'it has a search by movie title button' do
    movie_data = MovieService.search_results('The Godfather')
    movies = movie_data.map do |movie_info|
      Movie.new(movie_info)
    end
    fill_in :search, with: 'The Godfather'

    click_on 'Search Movies'

    expect(current_path).to eq(movies_path)
    expect(page).to have_content('The Godfather')
    expect(movies.length).to eq(40)
  end
end
