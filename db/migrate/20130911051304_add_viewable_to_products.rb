class AddViewableToProducts < ActiveRecord::Migration
  def change
    add_column :products, :viewable, :integer
  end
end
