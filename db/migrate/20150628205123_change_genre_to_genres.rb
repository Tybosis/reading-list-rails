class ChangeGenreToGenres < ActiveRecord::Migration
  def self.up
    rename_column :books, :genre, :genres
  end

  def self.down
    rename_column :books, :genres, :genre
  end
end
