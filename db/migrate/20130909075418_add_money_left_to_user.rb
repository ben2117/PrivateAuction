class AddMoneyLeftToUser < ActiveRecord::Migration
  def change
    add_column :users, :money_left, :decimal
  end
end
