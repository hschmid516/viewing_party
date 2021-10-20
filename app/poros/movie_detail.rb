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
    @genre_info = details[:genres]
    @summary = details[:overview]
    @cast_info = cast[:cast]
    @total_reviews = reviews[:total_results]
    @review_data = reviews[:results]
  end

  def genres
    @genre_info.pluck(:name)
  end

  def cast
    @cast_info.each_with_object([]) do |person, acc|
      acc << [person[:name], person[:character]]
    end
  end

  def reviews
    @review_data.each_with_object([]) do |review, acc|
      acc << [review[:author], review[:content]]
    end
  end
end
