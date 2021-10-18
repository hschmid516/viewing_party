class Movie
  attr_reader :id,
              :title,
              :vote_average

  def initialize(info)
    @id = info[:id]
    @title = info[:title]
    @vote_average = info[:vote_average]
  end
end
