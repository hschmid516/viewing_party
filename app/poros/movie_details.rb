class MovieDetails

  attr_reader :id,
              :run_time,
              :genres,
              :summary,
              :cast,
              :total_reviews,
              :reviews

  def initialize(info)
    @id = info[:id]
    @run_time = info[:run_time]
    @genre = info[:genre]
    @summary = info[:summary]
    @cast = info[:cast]
    @total_reviews = info[:total_reviews]
    @review = info[:review]
  end
end
