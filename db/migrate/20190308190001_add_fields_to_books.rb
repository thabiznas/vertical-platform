class AddFieldsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :title, :string
    add_column :books, :description, :text
    add_column :books, :image, :text
    add_column :books, :amazon_link, :string
    add_column :books, :panamericana_link, :string
  end
end
