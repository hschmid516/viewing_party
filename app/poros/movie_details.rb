class MovieDetails
  attr_reader :id,
              :title,
              :vote_average,
              :run_time,
              :genres,
              :summary,
              :cast,
              :total_reviews,
              :author,
              :reviews

  def initialize(details, cast, reviews)
    @id = details[:id]
    @title = details[:title]
    @vote_average = details[:vote_average]
    @run_time = details[:run_time]
    @genres = details[:genres].map { |genre| genre[:name] }
    @summary = details[:overview]
    @cast = cast[:cast]
    @total_reviews = reviews[:total_reviews]
    @reviews = reviews[:review]
    @author = reviews[:author]
  end
end
