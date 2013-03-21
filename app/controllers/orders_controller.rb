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

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    
    # created_at = [ params[:order]['created_at(1i)'], params[:order]['created_at(2i)'], params[:order]['created_at(3i)'] ].join("/")
    # created_at += " " + [params[:order]['created_at(4i)'], params[:order]['created_at(5i)']].join(":")

    # updated_at = [ params[:order]['updated_at(1i)'], params[:order]['updated_at(2i)'], params[:order]['updated_at(3i)'] ].join("/")
    # updated_at += " " + [params[:order]['updated_at(4i)'], params[:order]['updated_at(5i)']].join(":")

    # @order = Order.new(created_at: created_at.to_time, updated_at: updated_at.to_time)
    # @order.customer_id = params[:order][:customer_id]
    # @order.user_id = params[:order][:user_id]
    # @order.order_status_id = params[:order][:order_status_id]
    
    # date = [ params[:order]['created_at(1i)'], params[:order]['created_at(2i)'], params[:order]['created_at(3i)'] ].join("/")
    # date += " " + [params[:order]['created_at(4i)'], params[:order]['created_at(5i)']].join(":")

    # puts date

    @order = Order.new(params[:order])

    respond_to do |format|
      # if @order.save
      
      # else
      #   format.html { render action: "new" }
      #   format.json { render json: @order.errors, status: :unprocessable_entity }
      # end
      if @order.save

        # params[:order][:product_order_attributes].each do |p|
        #   product_order = ProductOrder.new(p)
        #   product_order.order = @order
        #   product_order.save
        # end

        format.html { redirect_to @order, notice: 'Order was successfully created.' }
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

