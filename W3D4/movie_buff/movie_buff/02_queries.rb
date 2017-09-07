def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie
    .where(yr: (1980..1989), score: (3..5))
    .select(:id, :title, :yr, :score)
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  # sub_query = Movie.where('score > 8').pluck(:yr)
  # Movie.where('yr NOT IN (?)', sub_query).select(:yr)
  Movie
    .group(:yr)
    .having('MAX(score) < 8')
    .pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor
    .joins(:movies)
    .where('title = ?',title )
    .order('castings.ord')
    .select('actors.id', 'actors.name')
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  Movie
    .joins(:actors, :castings, :director)
    .where('director_id = castings.actor_id AND castings.ord = 1')
    .select('movies.id, title, actors.name')
    .distinct

end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  Actor
    .joins(:castings)
    .where.not(castings: {ord: 1})
    .order('COUNT(castings.actor_id) DESC')
    .group('actors.id')
    .select('actors.id, actors.name, COUNT(castings.actor_id) AS roles')
    .limit(2)
end
