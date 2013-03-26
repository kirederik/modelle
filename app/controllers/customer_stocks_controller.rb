class CustomerStocksController < ApplicationController
  # GET /customer_stocks
  # GET /customer_stocks.json
  def index
    @customer_stocks = CustomerStock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customer_stocks }
    end
  end

  # GET /customer_stocks/1
  # GET /customer_stocks/1.json
  def show
    @customer_stock = CustomerStock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer_stock }
    end
  end

  # GET /customer_stocks/new
  # GET /customer_stocks/new.json
  def new
    @customer_stock = CustomerStock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer_stock }
    end
  end

  # GET /customer_stocks/1/edit
  def edit
    @customer_stock = CustomerStock.find(params[:id])
  end

  # POST /customer_stocks
  # POST /customer_stocks.json
  def create
    @customer_stock = CustomerStock.new(params[:customer_stock])

    respond_to do |format|
      if @customer_stock.save
        format.html { redirect_to @customer_stock, notice: 'Customer stock was successfully created.' }
        format.json { render json: @customer_stock, status: :created, location: @customer_stock }
      else
        format.html { render action: "new" }
        format.json { render json: @customer_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customer_stocks/1
  # PUT /customer_stocks/1.json
  def update
    @customer_stock = CustomerStock.find(params[:id])

    respond_to do |format|
      if @customer_stock.update_attributes(params[:customer_stock])
        format.html { redirect_to @customer_stock, notice: 'Customer stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_stocks/1
  # DELETE /customer_stocks/1.json
  def destroy
    @customer_stock = CustomerStock.find(params[:id])
    @customer_stock.destroy

    respond_to do |format|
      format.html { redirect_to customer_stocks_url }
      format.json { head :no_content }
    end
  end
end
