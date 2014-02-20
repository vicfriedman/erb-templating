class Movie
  attr_accessor :title, :release_date, :director, :summary

  def initialize(title, release_date, director, summary)
    self.title = title
    self.release_date = release_date
    self.director = director
    self.summary = summary
  end

end