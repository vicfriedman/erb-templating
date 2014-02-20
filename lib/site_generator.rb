class SiteGenerator

  def make_index!
    movies = Movie.all
    html = <<-HTML
<!DOCTYPE html>
<html>
  <head>
    <title>Movies</title>
  </head>
  <body>
    <ul>
HTML
    movies[0..-2].each do |movie|
      html << "      <li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>\n"
    end
    html << "      <li><a href=\"movies/#{movies.last.url}\">#{movies.last.title}</a></li>"
    html << <<-HTML

    </ul>
  </body>
</html>
HTML
    File.open('_site/index.html', 'w') do |f|
      f.write(html.chomp)
      f.close
    end
  end

  def generate_pages!
    template = ERB.new(File.open('lib/templates/movie.html.erb').read)
    movies = Movie.all
    movies.each do |movie|
      @movie = movie
      File.open("_site/movies/#{@movie.title.downcase.gsub(' ','_')}.html", "w+") do |f|
        f << template.result(binding)
        f.close
      end
    end
  end

end