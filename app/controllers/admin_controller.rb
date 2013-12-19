class AdminController < ApplicationController
  def index
  	@users = User.all#order(:group)
  	@products = Product.all
  	authorize! :manage, @users
  end
end
