class Movie

  attr_reader :id,
              :title,
              :vote_average
              # :runtime,
              # :genres,
              # :summary,
              # :cast,
              # :total_reviews,
              # :reviews

  def initialize(info)
    @id = info[:id]
    @title = info[:title]
    @vote_average = info[:vote_average]
    # @runtime = info[:]
    # @genres = info[:]
    # @summary = info[:]
    # @cast = info[:]
    # @total_reviews = info[:]
    # @reviews = info[:]
  end
end
