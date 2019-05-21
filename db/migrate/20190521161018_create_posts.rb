class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :string
      t.string :body
      t.string :text
      t.string :category
      t.string :string
      t.string :permalink
      t.string :string
      t.string :meta_title
      t.string :string
      t.string :meta_description
      t.string :text
      t.string :no_index
      t.string :boolean

      t.timestamps null: false
    end
  end
end
