class Movie < ActiveRecord::Base

  RATINGS = ["G", "PG", "PG-13", "R", "NC-17"]

  SORTABLE_COLUMNS = ["title", "rating", "release_date"]
  SORT_DIRECTIONS = ["asc", "desc"]

  validates :title, presence: true
  validates :rating, inclusion: { in: RATINGS }, allow_blank: true


  def self.sortmovies(column, direction)

    if(!SORTABLE_COLUMNS.include?(column))
      return order(:id)
    end

    if(!SORT_DIRECTIONS.include?(direction))
      direction = "asc"
    end

    return order(column => direction, :id => :asc)
  end

end
