class Movie < ActiveRecord::Base
  # Columns the index page may be sorted by (whitelist guards the ORDER BY clause)
  SORTABLE_COLUMNS = %w[title rating release_date].freeze
  SORT_DIRECTIONS = %w[asc desc].freeze

  def self.sorted_by(column, direction)
    column = SORTABLE_COLUMNS.include?(column) ? column : nil
    direction = SORT_DIRECTIONS.include?(direction) ? direction : "asc"
    column ? order(column => direction) : order(:id)
  end
end
