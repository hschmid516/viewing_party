require 'rails_helper'

RSpec.describe 'Movies#show', :vcr do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'has movie details' do
    details = MovieService.details(17473)
    cast = MovieService.cast(17473)
    reviews = MovieService.reviews(17473)
    movie = MovieDetail.new(details, cast, reviews)
    visit movie_path(movie.id)

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.vote_average)
    expect(page).to have_content(movie.runtime)
    expect(page).to have_content(movie.summary)
    expect(page).to have_content(movie.total_reviews)

    movie.genres.each do |genre|
      expect(page).to have_content(genre)
    end

    movie.cast.each do |actor, character|
      expect(page).to have_content(actor)
      expect(page).to have_content(character)
    end

    expect(movie.cast.length).to eq(10)

    movie.reviews.each do |author, review|
      expect(page).to have_content(author)
      expect(page).to have_content(review.tr("\n", ' '))
    end
  end

  it 'has button for creating party' do
    details = MovieService.details(17473)
    cast = MovieService.cast(17473)
    reviews = MovieService.reviews(17473)

    movie = MovieDetail.new(details, cast, reviews)

    visit movie_path(movie.id)

    click_button "Create Viewing Party for movie"

    expect(current_path).to eq(new_party_path)
  end
end
