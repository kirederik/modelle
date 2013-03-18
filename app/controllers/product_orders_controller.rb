class ProductOrdersController < ApplicationController
  # GET /product_orders
  # GET /product_orders.json
  def index
    @product_orders = ProductOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_orders }
    end
  end

  # GET /product_orders/1
  # GET /product_orders/1.json
  def show
    @product_order = ProductOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_order }
    end
  end

  # GET /product_orders/new
  # GET /product_orders/new.json
  def new
    @product_order = ProductOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_order }
    end
  end

  # GET /product_orders/1/edit
  def edit
    @product_order = ProductOrder.find(params[:id])
  end

  # POST /product_orders
  # POST /product_orders.json
  def create
    @product_order = ProductOrder.new(params[:product_order])

    respond_to do |format|
      if @product_order.save
        format.html { redirect_to @product_order, notice: 'Product order was successfully created.' }
        format.json { render json: @product_order, status: :created, location: @product_order }
      else
        format.html { render action: "new" }
        format.json { render json: @product_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_orders/1
  # PUT /product_orders/1.json
  def update
    @product_order = ProductOrder.find(params[:id])

    respond_to do |format|
      if @product_order.update_attributes(params[:product_order])
        format.html { redirect_to @product_order, notice: 'Product order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_orders/1
  # DELETE /product_orders/1.json
  def destroy
    @product_order = ProductOrder.find(params[:id])
    @product_order.destroy

    respond_to do |format|
      format.html { redirect_to product_orders_url }
      format.json { head :no_content }
    end
  end
end
