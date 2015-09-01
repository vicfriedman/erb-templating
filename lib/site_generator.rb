class SiteGenerator

  def make_index!
    html = <<-HTML
      <!DOCTYPE html>
      <html>
        <head>
          <title>Movies</title>
        </head>
        <body>
          <ul>
    HTML

    Movie.all.each do |movie|
      html << "<li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>\n"
    end

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
      # @movie = movie

      File.open("_site/movies/#{movie.url}", "w+") do |f|
        f << template.result(binding)
        f.close
      end
    end
  end

end