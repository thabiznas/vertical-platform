class AddNetflixLinkToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :netflix_link, :string
  end
end
