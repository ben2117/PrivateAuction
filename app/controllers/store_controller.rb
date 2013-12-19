class StoreController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@products = Product.order(:name)
  	@user = current_user

    @listProducts = @products.all(:conditions => { :viewable => (@user.group) })
  	winningproducts = @products.all(:conditions => { :high_bidder => (@user.id) })
  	totalprice = 0
  	winningproducts.each do |prod|
  		totalprice = totalprice + prod.current_price 
  	end
  	if @user.money_left != nil
  		@money_left = @user.money_left - totalprice
  	end
    authorize! :read, @products
  end

end
