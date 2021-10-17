require 'rails_helper'

RSpec.describe 'Movies#show' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit movie_path
  end

  scenario 'it has movie details' do
    VCR.use_cassette('movie_details') do
      movie_data = MovieService.details
      movies = movie_data.map do |movie_info|
        Movie.new(movie_info)
      end

      expect(current_path).to eq(movie_path)
      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie.vote_average)
      expect(page).to have_content(movie.runtime)
      expect(page).to have_content(movie.genre)
      expect(page).to have_content(movie.summary)
      expect(page).to have_content(movie.top_10_cast)
      expect(page).to have_content(movie.total_reviews)
      expect(page).to have_content(movie.author)
      expect(page).to have_content(movie.review)
    end
  end
end
