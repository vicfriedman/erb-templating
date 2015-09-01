class Movie
  attr_accessor :title, :release_date, :director, :summary
  @@all_movies = []
  def initialize(title, release_date, director, summary)
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary
    @@all_movies << self
  end

  def url
    "#{@title.gsub(" ", "_").downcase}.html"
  end

  def self.all
    @@all_movies
  end

  def self.reset_movies!
    @@all_movies = []
  end

  def self.make_movies!
    file = File.read('spec/fixtures/movies.txt')
    movies = file.split("\n")
    movie_info = []
    movies.each do |movie|
      movie_info << movie.split("-")
    end
    movie_info.each do |movie|
      # binding.pry
      Movie.new(movie[0].strip, movie[1].strip.to_i, movie[2].strip, movie[3].strip)
    end
    # binding.pry
  end

  def self.recent
    recent_movie = []
    @@all_movies.each do |movie|
      if movie.release_date >= 2012
        recent_movie << movie
      end
    end
    recent_movie 
  end
end