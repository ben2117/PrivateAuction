class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :original_price
      t.decimal :current_price
      t.string :image
      t.text :description
      t.datetime :end_time

      t.timestamps
    end
  end
end
