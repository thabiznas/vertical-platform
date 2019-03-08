class AddFieldsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :title, :string
    add_column :movies, :description , :text
    add_column :movies, :genre , :string
    add_column :movies, :image, :string
  end
end
