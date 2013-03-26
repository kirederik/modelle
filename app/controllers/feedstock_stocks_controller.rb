class FeedstockStocksController < ApplicationController
  # GET /feedstock_stocks
  # GET /feedstock_stocks.json
  def index
    @feedstock_stocks = FeedstockStock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedstock_stocks }
    end
  end

  # GET /feedstock_stocks/1
  # GET /feedstock_stocks/1.json
  def show
    @feedstock_stock = FeedstockStock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedstock_stock }
    end
  end

  # GET /feedstock_stocks/new
  # GET /feedstock_stocks/new.json
  def new
    @feedstock_stock = FeedstockStock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedstock_stock }
    end
  end

  # GET /feedstock_stocks/1/edit
  def edit
    @feedstock_stock = FeedstockStock.find(params[:id])
  end

  # POST /feedstock_stocks
  # POST /feedstock_stocks.json
  def create
    @feedstock_stock = FeedstockStock.new(params[:feedstock_stock])

    respond_to do |format|
      if @feedstock_stock.save
        format.html { redirect_to @feedstock_stock, notice: 'Feedstock stock was successfully created.' }
        format.json { render json: @feedstock_stock, status: :created, location: @feedstock_stock }
      else
        format.html { render action: "new" }
        format.json { render json: @feedstock_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedstock_stocks/1
  # PUT /feedstock_stocks/1.json
  def update
    @feedstock_stock = FeedstockStock.find(params[:id])

    respond_to do |format|
      if @feedstock_stock.update_attributes(params[:feedstock_stock])
        format.html { redirect_to @feedstock_stock, notice: 'Feedstock stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedstock_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedstock_stocks/1
  # DELETE /feedstock_stocks/1.json
  def destroy
    @feedstock_stock = FeedstockStock.find(params[:id])
    @feedstock_stock.destroy

    respond_to do |format|
      format.html { redirect_to feedstock_stocks_url }
      format.json { head :no_content }
    end
  end
end
