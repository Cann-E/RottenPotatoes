wiki = "https://upload.wikimedia.org/wikipedia/en"

more_movies = [
  {:title => 'My Neighbor Totoro', :rating => 'G',
    :release_date => '16-Apr-1988',
    :poster_url => "#{wiki}/0/02/My_Neighbor_Totoro_-_Tonari_no_Totoro_%28Movie_Poster%29.jpg"},
  {:title => 'Green Book', :rating => 'PG-13',
    :release_date => '16-Nov-2018',
    :poster_url => "#{wiki}/5/5b/Green_Book_%282018_poster%29.png"},
  {:title => 'Parasite', :rating => 'R',
    :release_date => '30-May-2019',
    :poster_url => "#{wiki}/5/53/Parasite_%282019_film%29.png"},
  {:title => 'Nomadland', :rating => 'R',
    :release_date => '19-Feb-2021',
    :poster_url => "#{wiki}/a/a5/Nomadland_poster.jpeg"},
  {:title => 'CODA', :rating => 'PG-13',
    :release_date => '13-Aug-2021',
    :poster_url => "#{wiki}/8/89/Coda_poster.jpeg"},

  {:title => 'Avengers: Infinity War', :rating => 'PG-13',
    :release_date => '27-Apr-2018',
    :poster_url => "#{wiki}/4/4d/Avengers_Infinity_War_poster.jpg"},
  {:title => 'Inception', :rating => 'PG-13',
    :release_date => '16-Jul-2010',
    :poster_url => "#{wiki}/2/2e/Inception_%282010%29_theatrical_poster.jpg"},

  {:title => 'Batman Begins', :rating => 'PG-13',
    :release_date => '15-Jun-2005',
    :poster_url => "#{wiki}/a/af/Batman_Begins_Poster.jpg"},
  {:title => 'The Dark Knight', :rating => 'PG-13',
    :release_date => '18-Jul-2008',
    :poster_url => "#{wiki}/1/1c/The_Dark_Knight_%282008_film%29.jpg"},
  {:title => 'The Dark Knight Rises', :rating => 'PG-13',
    :release_date => '20-Jul-2012',
    :poster_url => "#{wiki}/8/83/Dark_knight_rises_poster.jpg"},
  {:title => 'The Batman', :rating => 'PG-13',
    :release_date => '04-Mar-2022',
    :poster_url => "#{wiki}/f/ff/The_Batman_%28film%29_poster.jpg"},

  {:title => 'The Shining', :rating => 'R',
    :release_date => '23-May-1980',
    :poster_url => "#{wiki}/1/1d/The_Shining_%281980%29_U.K._release_poster_-_The_tide_of_terror_that_swept_America_IS_HERE.jpg"},
  {:title => 'The Conjuring', :rating => 'R',
    :release_date => '19-Jul-2013',
    :poster_url => "#{wiki}/8/8c/The_Conjuring_poster.jpg"},
  {:title => 'Get Out', :rating => 'R',
    :release_date => '24-Feb-2017',
    :poster_url => "#{wiki}/a/a3/Get_Out_poster.png"},
  {:title => 'It', :rating => 'R',
    :release_date => '08-Sep-2017',
    :poster_url => "#{wiki}/5/5a/It_%282017%29_poster.jpg"},
  {:title => 'A Quiet Place', :rating => 'PG-13',
    :release_date => '06-Apr-2018',
    :poster_url => "#{wiki}/a/a0/A_Quiet_Place_film_poster.png"},
  {:title => 'Hereditary', :rating => 'R',
    :release_date => '08-Jun-2018',
    :poster_url => "#{wiki}/d/d9/Hereditary.png"}
]

more_movies.each do |movie|

  m = Movie.find_or_initialize_by(:title => movie[:title])

  if(m.new_record?)
    m.rating = movie[:rating]
    m.release_date = movie[:release_date]
  end

  if(m.poster_url.blank?)
    m.poster_url = movie[:poster_url]
  end

  m.save!

end
