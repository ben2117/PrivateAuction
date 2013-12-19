class Product < ActiveRecord::Base
  attr_accessible :current_price, :description, :end_time, :image, :name, :original_price, :high_bidder, :viewable
  has_many :bids, dependent: :destroy

end
