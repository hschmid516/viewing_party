require 'rails_helper'

RSpec.describe 'Movies#show' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  scenario 'it has movie details' do
    VCR.use_cassette('movie_details') do
      details = MovieService.details(238)
      cast = MovieService.cast(238)
      reviews = MovieService.reviews(238)

      movie = MovieDetails.new(details, cast, reviews)

      visit movie_path(movie.id)

      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie.vote_average)
      expect(page).to have_content(movie.run_time)
      movie.genres.each do |genre|
        expect(page).to have_content(genre)
      end
      expect(page).to have_content(movie.summary)
      expect(page).to have_content(movie.cast)
      expect(page).to have_content(movie.total_reviews)
      expect(page).to have_content(movie.author)
      expect(page).to have_content(movie.reviews)
      save_and_open_page
    end
  end
end
