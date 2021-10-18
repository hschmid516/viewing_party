class MovieService
  class << self
    BASE_URL = ' https://api.themoviedb.org/3 '

    def get_data(endpoint)
      response = Faraday.get(endpoint)
      data = response.body
      JSON.parse(data, symbolize_names: true)
    end

    def top40
      top_rated(1) + top_rated(2)
    end


    def top_rated(page)
      get_data("#{BASE_URL}/movie/top_rated?api_key=#{ENV['API_KEY']}&language=en-US&page=#{page}")[:results]
    end

    def reviews(movie_id)
      get_data("#{BASE_URL}/movie/#{movie_id}/reviews?api_key=#{ENV['API_KEY']}&language=en-US&page=1")
    end

    def cast(movie_id)
      get_data("#{BASE_URL}/movie/#{movie_id}/credits?api_key=#{ENV['API_KEY']}&language=en-US")
    end

    def top_40_searched(search)
      search_by_title(search, 1) + search_by_title(search, 2)
    end

    def search_by_title(search, page)
      get_data("#{BASE_URL}/search/movie?api_key=#{ENV['API_KEY']}&language=en-US&page=#{page}&include_adult=false&query=#{search}")[:results]
    end

    def details(movie_id)
      get_data("#{BASE_URL}/movie/#{movie_id}?api_key=#{ENV['API_KEY']}&language=en-US")
    end
  end
end
