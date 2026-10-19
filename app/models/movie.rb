class Movie < ActiveRecord::Base

  RATINGS = ["G", "PG", "PG-13", "R", "NC-17"]

  SORTABLE_COLUMNS = ["title", "rating", "release_date"]
  SORT_DIRECTIONS = ["asc", "desc"]

  validates :title, presence: true
  validates :rating, inclusion: { in: RATINGS }, allow_blank: true
  validate :checkposter


  def checkposter

    if(poster_url.blank?)
      return
    end

    if(poster_url.start_with?("data:image/"))
      if(poster_url.length > 2_000_000)
        errors.add(:poster_url, "image is too big")
      end
      return
    end

    if(!poster_url.start_with?("http://", "https://"))
      errors.add(:poster_url, "must be an uploaded image or a link starting with http")
    end

  end


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
