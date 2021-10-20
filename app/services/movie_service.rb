class MovieService
  class << self
    BASE_URL = 'https://api.themoviedb.org/3'.freeze

    def get_data(endpoint)
      response = Faraday.get(
        endpoint,
        { api_key: ENV['API_KEY'] },
        { language: 'en-US' }
      )
      data = response.body
      JSON.parse(data, symbolize_names: true)
    end

    def top_movies
      top_rated(1) + top_rated(2)
    end

    def top_rated(page)
      get_data("#{BASE_URL}/movie/top_rated?page=#{page}")[:results]
    end

    def reviews(movie_id)
      get_data("#{BASE_URL}/movie/#{movie_id}/reviews?page=1")
    end

    def cast(movie_id)
      get_data("#{BASE_URL}/movie/#{movie_id}/credits?")
    end

    def search_results(search)
      search_by_title(search, 1) + search_by_title(search, 2)
    end

    def search_by_title(search, page)
      get_data("#{BASE_URL}/search/movie?&page=#{page}&include_adult=false&query=#{search}")[:results]
    end

    def details(movie_id)
      get_data("#{BASE_URL}/movie/#{movie_id}")
    end

    def backdrop(imdb_id)
      get_data("#{BASE_URL}/find/#{imdb_id}?external_source=imdb_id")[:movie_results].first
    end

    def recommendations(movie_id)
      get_data("#{BASE_URL}/movie/#{movie_id}/recommendations?page=1")[:results]
    end
  end
end
