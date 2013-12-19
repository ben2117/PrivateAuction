class AddHighBidderToProduct < ActiveRecord::Migration
  def change
    add_column :products, :high_bidder, :integer
  end
end
