class ChangePosterUrlToText < ActiveRecord::Migration[8.1]
  def up
    change_column :movies, :poster_url, :text
  end

  def down
    change_column :movies, :poster_url, :string
  end
end
