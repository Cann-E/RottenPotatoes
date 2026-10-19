# RottenPotatoes (Hello Rails)

A Rails 8 app for cataloging movies: create, view, edit and delete movies, with a
sortable movie table (title, rating, release date, ascending/descending) whose sort
choice is remembered across pages.

## Running locally

```sh
bundle install
bin/rails db:migrate db:seed
bin/rails server
```

Then visit http://localhost:3000.
