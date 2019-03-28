class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :payment_plan_gateway_identifier
      t.string :name
      t.monetize :price
      t.integer :interval
      t.integer :interval_count
      t.integer :status
      t.text :description

      t.timestamps null: false
    end
  end
end
