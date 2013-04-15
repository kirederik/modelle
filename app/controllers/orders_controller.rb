#encoding: utf-8
class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new

    if (params[:customer_id] == nil)
      respond_to do |format|
        format.html {redirect_to action: "index", controller: "customers" }
      end
    else
        
      customer = Customer.find(params[:customer_id])

      @order = Order.new
      @order.customer = customer
      @order.user = current_user

      3.times { @order.product_orders.build }
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @order }
      end

    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    
    @order = Order.new(params[:order])
    has_all_products = true

    puts @order.created_at
    puts @order.updated_at
    puts @order.order_status_id
    puts @order.customer_id
    puts @order.user_id
    puts @order.product_orders


    puts @order.valid?
    puts @order.errors.full_messages

    @order.product_orders.each do |po|
      stock_item = ProductStock.where(product_id: po.product_id).first
      if stock_item == nil
        respond_to do |format|
          format.html { redirect_to action: "new", :customer_id => @order.customer_id, notice: "O estoque ainda de alguns produtos ainda não foi criado, por favor certifique-se de que o estoque de todos or produtos estejam criados" }
        end
        return
      end
    end

    respond_to do |format|
      if @order.save

        format.html { redirect_to @order, notice: 'Pedido criado com sucesso.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { redirect_to action: "new", :customer_id => @order.customer_id, notice: "Verique se todos os campos foram preenchidos" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  
  def add_products
    @order = Order.find(params[:order_id])
    @product_order = ProductOrder.new
    @product_order.order = @order
  end
end
