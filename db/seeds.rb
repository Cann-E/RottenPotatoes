wiki = "https://upload.wikimedia.org/wikipedia/en"

more_movies = [
  {:title => 'Parasite', :rating => 'R',
    :release_date => '30-May-2019',
    :description => "A poor family slowly works its way into a rich family's house, and things get dark.",
    :poster_url => "#{wiki}/5/53/Parasite_%282019_film%29.png"},

  {:title => 'The Equalizer', :rating => 'R',
    :release_date => '26-Sep-2014',
    :description => "A quiet ex-government operative comes out of retirement to protect a young girl from the Russian mob.",
    :poster_url => "#{wiki}/8/81/The_Equalizer_poster.jpg"},
  {:title => 'John Wick', :rating => 'R',
    :release_date => '24-Oct-2014',
    :description => "A retired hitman goes after the gangsters who stole his car and killed his dog.",
    :poster_url => "#{wiki}/9/98/John_Wick_TeaserPoster.jpg"},
  {:title => 'Whiplash', :rating => 'R',
    :release_date => '10-Oct-2014',
    :description => "A young jazz drummer gets pushed to his limit by a brutal music teacher.",
    :poster_url => "#{wiki}/0/01/Whiplash_poster.jpg"},
  {:title => 'War Dogs', :rating => 'R',
    :release_date => '19-Aug-2016',
    :description => "Two friends in their twenties land a huge Pentagon deal to arm the Afghan military.",
    :poster_url => "#{wiki}/5/52/War_Dogs_2016_poster.jpg"},

  {:title => 'Avengers: Infinity War', :rating => 'PG-13',
    :release_date => '27-Apr-2018',
    :description => "Thanos goes after the Infinity Stones and the Avengers try to stop him before half the universe disappears.",
    :poster_url => "#{wiki}/4/4d/Avengers_Infinity_War_poster.jpg"},
  {:title => 'Inception', :rating => 'PG-13',
    :release_date => '16-Jul-2010',
    :description => "A thief who steals secrets from dreams gets one last job: planting an idea instead.",
    :poster_url => "#{wiki}/2/2e/Inception_%282010%29_theatrical_poster.jpg"},

  {:title => 'Batman Begins', :rating => 'PG-13',
    :release_date => '15-Jun-2005',
    :description => "Bruce Wayne trains, returns to Gotham, and becomes Batman for the first time.",
    :poster_url => "#{wiki}/a/af/Batman_Begins_Poster.jpg"},
  {:title => 'The Dark Knight', :rating => 'PG-13',
    :release_date => '18-Jul-2008',
    :description => "Batman faces the Joker, who just wants to watch Gotham burn.",
    :poster_url => "#{wiki}/1/1c/The_Dark_Knight_%282008_film%29.jpg"},
  {:title => 'The Dark Knight Rises', :rating => 'PG-13',
    :release_date => '20-Jul-2012',
    :description => "Eight years later, Batman comes back to take on Bane.",
    :poster_url => "#{wiki}/8/83/Dark_knight_rises_poster.jpg"},
  {:title => 'The Batman', :rating => 'PG-13',
    :release_date => '04-Mar-2022',
    :description => "A younger Batman hunts the Riddler through a dark, rainy Gotham.",
    :poster_url => "#{wiki}/f/ff/The_Batman_%28film%29_poster.jpg"},

  {:title => 'The Shining', :rating => 'R',
    :release_date => '23-May-1980',
    :description => "A writer takes a winter job at an empty hotel with his family. The hotel has other plans.",
    :poster_url => "#{wiki}/1/1d/The_Shining_%281980%29_U.K._release_poster_-_The_tide_of_terror_that_swept_America_IS_HERE.jpg"},
  {:title => 'The Conjuring', :rating => 'R',
    :release_date => '19-Jul-2013',
    :description => "Paranormal investigators Ed and Lorraine Warren help a family haunted in their farmhouse.",
    :poster_url => "#{wiki}/8/8c/The_Conjuring_poster.jpg"},
  {:title => 'Get Out', :rating => 'R',
    :release_date => '24-Feb-2017',
    :description => "A weekend visit to meet his girlfriend's parents turns into something way worse.",
    :poster_url => "#{wiki}/a/a3/Get_Out_poster.png"},
  {:title => 'It', :rating => 'R',
    :release_date => '08-Sep-2017',
    :description => "A group of kids in Derry face Pennywise, a clown that feeds on fear.",
    :poster_url => "#{wiki}/5/5a/It_%282017%29_poster.jpg"},
  {:title => 'A Quiet Place', :rating => 'PG-13',
    :release_date => '06-Apr-2018',
    :description => "A family survives by staying silent, because the monsters hunt by sound.",
    :poster_url => "#{wiki}/a/a0/A_Quiet_Place_film_poster.png"},
  {:title => 'Hereditary', :rating => 'R',
    :release_date => '08-Jun-2018',
    :description => "After their grandmother dies, a family starts uncovering terrifying secrets.",
    :poster_url => "#{wiki}/d/d9/Hereditary.png"}
]

more_movies.each do |movie|

  m = Movie.find_or_initialize_by(:title => movie[:title])

  if(m.new_record?)
    m.rating = movie[:rating]
    m.release_date = movie[:release_date]
  end

  if(m.description.blank?)
    m.description = movie[:description]
  end

  if(m.poster_url.blank?)
    m.poster_url = movie[:poster_url]
  end

  m.save!

end
