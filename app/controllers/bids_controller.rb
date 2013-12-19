class BidsController < ApplicationController
  # GET /bids
  # GET /bids.json
  def index
    @bids = Bid.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bids }
    end
    #authorize! :manage, @bids
    authorize! :manage, @bids
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
    @bid = Bid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bid }
    end
    authorize! :manage, @bid
  end

  # GET /bids/new
  # GET /bids/new.json
  def new
    @bid = Bid.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bid }
    end
    authorize! :manage, @bid
  end

  # GET /bids/1/edit
  def edit
    @bid = Bid.find(params[:id])
    authorize! :manage, @bid
  end

  # POST /bids
  # POST /bids.json
  def create
    @user = current_user
    @product = Product.find(params[:product_id])
    @bid = @user.bids.build
    @product.high_bidder = @user.id
    @bid.product = @product
    @product.current_price = @product.current_price + @product.current_price * 0.1
    @product.save
    
    #implement later for time controlled bids
    #if @product.end_time - Time.now > 0
    #
    #send

    respond_to do |format|
      if @bid.save
        
        format.html { redirect_to :back, notice: 'Bid was successfully created.' }
        format.json { render json: @bid, status: :created, location: @bid }
      else
        format.html { render action: "new" }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PUT /bids/1
  # PUT /bids/1.json
  def update
    @bid = Bid.find(params[:id])

    respond_to do |format|
      if @bid.update_attributes(params[:bid])
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
    authorize! :manage, @bid
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy

    respond_to do |format|
      format.html { redirect_to bids_url }
      format.json { head :no_content }
    end
  end
  authorize! :manage, @bid
end
