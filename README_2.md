# RottenPotatoes

A small Rails app for keeping track of movies. You can add, view, edit, and delete movies, see them as a poster wall or a sortable table, and upload a poster for each one.



## Project structure

```
rottenpotatoes/
├── app/
│   ├── assets/stylesheets/
│   │   └── application.css
│   ├── controllers/
│   │   └── movies_controller.rb
│   ├── helpers/
│   │   └── movies_helper.rb
│   ├── javascript/
│   │   └── application.js
│   ├── models/
│   │   └── movie.rb
│   └── views/
│       ├── layouts/application.html.erb
│       └── movies/
│           ├── _form.html.erb
│           ├── _movie.html.erb
│           ├── edit.html.erb
│           ├── index.html.erb
│           ├── new.html.erb
│           └── show.html.erb
│
├── config/
│   ├── database.yml
│   └── routes.rb
│
├── db/
│   ├── migrate/
│   ├── schema.rb
│   └── seeds.rb
│
├── Gemfile
├── Gemfile.lock
├── Procfile
└── README.md
```

## Setup

You need Ruby and Bundler installed. The app was built and tested with Ruby 4.0.6 and Rails 8.1.

Check your Ruby version:

```
ruby -v
```

Clone the repository and go into the folder:

```
git clone https://github.com/Cann-E/RottenPotatoes.git
cd RottenPotatoes
```

Install the gems:

```
bundle install
```

Create the database and load the movies:

```
bin/rails db:migrate db:seed
```

On Windows, put `ruby` in front of the command: `ruby bin/rails db:migrate db:seed`.

## Running the app

```
bin/rails server
```

Then open http://localhost:3000 in a browser. Press `Ctrl+C` in the terminal to stop the server.

## Main features

- Add movies
- View a movie's details
- Edit movies
- Delete movies
- Upload a poster from your computer or paste an image link
- Poster wall view and table view
- Sort by title, rating, or release date (ascending and descending)
- Sort choice and view are remembered when you leave the page and come back

## Table and poster views

The movie list opens as a table by default. Use the **Posters | Table** switch at the top right of the list to change views.

- **Table** - one row per movie with title, rating, and release date. It uses `<thead>`, `<th>`, `<tbody>`, and `<tfoot>`, and the footer shows how many movies are in the catalog. Click a column header to sort.
- **Posters** - the same movies as a poster wall. The **Sort by** buttons above it sort the same way as the table headers.

Both views share the same sort, and the app remembers which view you picked.

## How sorting works

Sorting happens in the model with ActiveRecord (`Movie.sortmovies`), so the database does the ordering. Only `title`, `rating`, and `release_date` are allowed as sort columns, so nothing else from the URL can get into the query.

The sorted column is highlighted:

- Yellow with ▲ for ascending
- Blue with ▼ for descending

The arrows give a non-color cue, and the table header also sets `aria-sort` for screen readers. The current sort is saved in the session.

## Seed data

`db/seeds.rb` has 17 movies with posters and short descriptions. It uses `find_or_initialize_by` on the title, so running `db:seed` again does not create duplicates:

```
bin/rails db:seed
```

## Deploying to Heroku

The `pg` gem is only used in production and `sqlite3` only in development and test.

The `Procfile` runs the migrations and the seeds on every deploy:

```
web: bundle exec rails server -p $PORT
release: bundle exec rails db:migrate && bundle exec rails db:seed
```

To update the live app after a change:

```
git push heroku main
```

## Known limitations

- Uploaded posters are resized in the browser and saved in the database, not as files. This keeps them safe on Heroku, where uploaded files are deleted when the app restarts.
- Posters for the seed movies are linked from Wikipedia, so they need an internet connection to show up.
- There are no user accounts. Anyone with the link can add, edit, or delete movies.

## AI tools used

**Claude Code**

- Used in VS Code and the terminal for coding help
- Helped with debugging and with file edits that I checked and ran
- Explained Rails parts I was missing, like routes, migrations, sessions, and Heroku deployment

