class MovieDetail
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :cast,
              :total_reviews,
              :reviews

  def initialize(details, cast, reviews)
    @id = details[:id]
    @title = details[:title]
    @vote_average = details[:vote_average]
    @runtime = details[:runtime]
    @genres = details[:genres].map { |genre| genre[:name] }
    @summary = details[:overview]
    @cast = cast[:cast].each_with_object([]) do |person, acc|
      acc << [person[:name], person[:character]]
    end
    @total_reviews = reviews[:total_results]
    @reviews = reviews[:results].each_with_object([]) do |review, acc|
      acc << [review[:author],review[:content]]
    end
  end
end
