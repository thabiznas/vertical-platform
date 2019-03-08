class AddFieldsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :title, :string
    add_column :songs, :artist, :string
    add_column :songs, :genre, :string
    add_column :songs, :youtube_link, :string
    add_column :songs, :spotify_link, :string
  end
end
