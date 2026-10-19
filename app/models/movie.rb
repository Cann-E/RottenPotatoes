class Movie < ActiveRecord::Base
  RATINGS = %w[G PG PG-13 R NC-17].freeze
  # Columns the index page may be sorted by (whitelist guards the ORDER BY clause)
  SORTABLE_COLUMNS = %w[title rating release_date].freeze
  SORT_DIRECTIONS = %w[asc desc].freeze

  validates :title, presence: true
  validates :rating, inclusion: { in: RATINGS }, allow_blank: true

  def self.sorted_by(column, direction)
    return order(:id) unless SORTABLE_COLUMNS.include?(column)

    direction = SORT_DIRECTIONS.include?(direction) ? direction : "asc"
    order(column => direction, :id => :asc)
  end
end
