class Backdrop
  attr_reader :backdrop_path

  def initialize(movie_info)
    @backdrop_path = movie_info[:backdrop_path]
  end
end
