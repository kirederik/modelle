#encoding: utf-8
class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  # caches_page :new, :create
  # caches_action :new, :index, :create
  include OrdersHelper

  def index  
    order_status = OrderStatus.where(name: "Fechado").first
    @orders = Order.where("order_status_id <> ?", order_status.id).page(params[:page]).per(25)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def index_all

    @orders = nil
    
    if params[:filter] == '1'
      customers = Customer.where('lower(name) like lower(?)', "%#{params[:customer_name]}%")
      
      customers_id = []
      customers.map { |e| customers_id << e.id }

      if customers
        @orders = Order.where("customer_id in (#{customers_id.join(",")}) #{build_criteria(params)} ").page(params[:page]).per(25)
      else
        @orders = Order.where("1 = 1 #{build_criteria(params)} ").page(params[:page]).per(25)
      end
      puts @orders
    else
      @orders = Order.page(params[:page]).per(25)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
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

    if (params[:customer_id] == nil || params[:customer_id] == "")
      respond_to do |format|
        flash[:notice] = "Selecione um cliente antes de prosseguir"
        format.html {redirect_to action: "prepare_order" }
      end
    else
        
      customer = Customer.find(params[:customer_id])

      @order = Order.new
      @order.customer = customer
      @order.user = current_user

      @order.product_orders.build
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @order }
      end

    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @order.product_orders.build
    if @order.order_status.name == 'Fechado'
      flash[:notice] = "Pedido já esta'fechado, não é possível editá-lo!"
      redirect_to @order
    else
      @order
    end
  end

  def close
    @order = Order.find(params[:id])
    if @order.order_status.name.include? "Fechado"
      respond_to do |format| 
        flash[:notice] = "Pedido já fechado" 
        format.html { redirect_to action: "index" }
      end
    else 
      pro_ors = @order.product_orders
      finished = true

      # Verifica se existe algum produto que não está com o status adequado para fechar o pedido
      pro_ors.each do |po| 
        puts po.status
        if po.status_full == "not ready"
          finished = false
          break
        end
      end

      if not finished
        # Caso exista, não pode finalizar ainda
        respond_to do |format| 
          flash[:error] = "Pedido ainda não pode ser fechado por que existem produtos a serem produzidos. Certifique-se!" 
          format.html { redirect_to @order }
        end
      else
        if @order.order_type.name == "Normal"
          status = OrderStatus.where('name = ?', "Fechado")[0]
          @order.update_attributes(:order_status_id => status.id)
        else
          status = OrderStatus.where('name = ?', "Fechado - Enviado Cliente")[0]
          @order.update_attributes(:order_status_id => status.id)
          
          pro_ors.each do |po| 
            cus_stock = CustomerStock.where('customer_id = ? and product_id = ?', @order.customer.id, po.product_id)[0]
            if cus_stock == nil
              CustomerStock.new(
                customer_id: @order.customer_id, 
                product_id: po.product_id, 
                quantity: po.quantity_stock
              ).save
            else
              cus_stock.update_attributes(:quantity => cus_stock.quantity + po.quantity_stock)
            end
          end
        end
        respond_to do |format| 
          flash[:notice] = "Pedido fechado com sucesso" 
          format.html { redirect_to action: "index" }
        end
      end
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    has_all_products = true

    
    @order.product_orders.each do |po|
      po.quantity_stock = 0
      po.quantity_production = 0
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
        format.html { redirect_to @order, notice: 'Pedido atualizado com sucesso.' }
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

  def coupon
    @order = Order.find(params[:id])
    @showPrice = params[:showPrice]
    @discount = 0
    if @order.customer.discount
      @discount =  @order.customer.discount
    end
  end

  def prepare_order
    
  end

end

