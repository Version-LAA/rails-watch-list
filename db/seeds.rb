# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TMDB_KEY="7c54ee7ee8de8d49e4fbcad0a135d7f3"
puts "initiating db seed"
Movie.destroy_all

puts "databased cleared"
120.times do |i|
  if i != 0
    url = "https://api.themoviedb.org/3/movie/top_rated?api_key=7c54ee7ee8de8d49e4fbcad0a135d7f3&page=#{i}"
    request = URI.open(url).read
    response = JSON.parse(request)
    movie_list = response["results"]
    movie_list.each do |movie|
      new_movie = Movie.create(
        title: movie["title"],
        overview: movie["overview"],
        poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
        rating: movie["vote_average"]
      )
      puts "movie #{new_movie.id} created "
    end
  end
end
