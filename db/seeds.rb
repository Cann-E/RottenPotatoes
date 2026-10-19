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
  {:title => 'Spirited Away', :rating => 'PG',
    :release_date => '20-Jul-2001',
    :poster_url => "#{wiki}/d/db/Spirited_Away_Japanese_poster.png"},
  {:title => 'The Dark Knight', :rating => 'PG-13',
    :release_date => '18-Jul-2008',
    :poster_url => "#{wiki}/1/1c/The_Dark_Knight_%282008_film%29.jpg"},
  {:title => 'Inception', :rating => 'PG-13',
    :release_date => '16-Jul-2010',
    :poster_url => "#{wiki}/2/2e/Inception_%282010%29_theatrical_poster.jpg"},
  {:title => 'Everything Everywhere All at Once', :rating => 'R',
    :release_date => '25-Mar-2022',
    :poster_url => "#{wiki}/1/1e/Everything_Everywhere_All_at_Once.jpg"},
  {:title => 'Oppenheimer', :rating => 'R',
    :release_date => '21-Jul-2023',
    :poster_url => "#{wiki}/4/4a/Oppenheimer_%28film%29.jpg"}
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
