class MovieFacade
  class << self
    def top_movies
      movie_data = MovieService.top_movies
      movie_data.map do |movie_info|
        Movie.new(movie_info)
      end
    end

    def find_movies(search_params)
      movie_data = MovieService.search_results(search_params)
      movie_data.map do |movie_info|
        Movie.new(movie_info)
      end
    end

    def movie_details(movie_id)
      details = MovieService.details(movie_id)
      cast = MovieService.cast(movie_id)
      reviews = MovieService.reviews(movie_id)
      MovieDetail.new(details, cast, reviews)
    end
  end
end
