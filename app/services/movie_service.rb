class MovieService
  class << self
  BASE_URL = "https://api.themoviedb.org/3"

    def get_data(endpoint)
      response = Faraday.get(endpoint)
      data = response.body
      JSON.parse(data, symbolize_names:  true)
    end

    def top_40
      top_rated(1) + top_rated(2)
    end

    def top_rated(page)
      get_data("#{BASE_URL}/movie/top_rated?api_key=#{ENV['API_KEY']}&language=en-US&page=#{page}")[:results]
    end

    def movie_reviews(movie_id)
      get_data("#{BASE_URL}/movie/{movie_id}/reviews?api_key=#{ENV['API_KEY']}&language=en-US&page=1")
    end

    def movie_cast(movie_id)
      get_data("#{BASE_URL}/movie/#{movie_id}/credits?api_key=#{ENV['API_KEY']}&language=en-US")
    end
  end
end
