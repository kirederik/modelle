class CustomerPricesController < ApplicationController
  # GET /customer_prices
  # GET /customer_prices.json
  def index
    @customer_prices = CustomerPrice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customer_prices }
    end
  end


  # GET /customer_prices/1
  # GET /customer_prices/1.json
  def show
    @customer_price = CustomerPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer_price }
    end
  end

  # GET /customer_prices/new
  # GET /customer_prices/new.json
  def new
    @customer_price = CustomerPrice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer_price }
    end
  end

  # GET /customer_prices/1/edit
  def edit
    @customer_price = CustomerPrice.find(params[:id])
  end

  # POST /customer_prices
  # POST /customer_prices.json
  def create
    @customer_price = CustomerPrice.new(params[:customer_price])

    respond_to do |format|
      if @customer_price.save
        format.html { redirect_to @customer_price, notice: 'Customer price was successfully created.' }
        format.json { render json: @customer_price, status: :created, location: @customer_price }
      else
        format.html { render action: "new" }
        format.json { render json: @customer_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customer_prices/1
  # PUT /customer_prices/1.json
  def update
    @customer_price = CustomerPrice.find(params[:id])

    respond_to do |format|
      if @customer_price.update_attributes(params[:customer_price])
        format.html { redirect_to @customer_price, notice: 'Customer price was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_prices/1
  # DELETE /customer_prices/1.json
  def destroy
    @customer_price = CustomerPrice.find(params[:id])
    @customer_price.destroy

    respond_to do |format|
      format.html { redirect_to customer_prices_url }
      format.json { head :no_content }
    end
  end
end
