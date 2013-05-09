#encoding: utf-8
class ProductionItemsController < ApplicationController
  # GET /production_items
  # GET /production_items.json
  def index
    if params[:production_status_id]
      @production_items = ProductionItem.where(production_status_id: params[:production_status_id])  
    else
      @production_items = ProductionItem.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @production_items }
    end
  end

  # GET /production_items/1
  # GET /production_items/1.json
  def show
    @production_item = ProductionItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @production_item }
    end
  end

  # GET /production_items/new
  # GET /production_items/new.json
  def new
    @production_item = ProductionItem.new

    if params[:order_id]
      order = Order.find(params[:order_id])
      @production_item.order = order

      order.product_orders.each do |po|
        if po.status == nil 
          @production_item.product_order_outs.build
          @production_item.product_order_outs.last.quantity = po.quantity
          @production_item.product_order_outs.last.product = po.product
        end
      end
    end

    respond_to do |format|
      if @production_item.product_order_outs.size == 0
        flash[:alert] = 'Todos or produtos deste pedido já foram processados.'
        format.html { redirect_to order_path(@production_item.order) }
      else
        format.html # new.html.erb
        format.json { render json: @production_item }
      end
    end
  end

  # GET /production_items/1/edit
  def edit
    @production_item = ProductionItem.find(params[:id])
  end

  # POST /production_items
  # POST /production_items.json
  def create
    @production_item = ProductionItem.new(params[:production_item])
    have_feedstock = true

    respond_to do |format|
      @production_item.product_order_outs.each do |po| 
        if po.product.verify_feedstock != []
          flash[:error] = "Não há matéria-prima para produzir todos os produtos"
          have_feedstock = false
        end
      end
      puts "já passou"

      if !have_feedstock
        
        format.html { render action: "new" }
        format.json { render json: @production_item.errors, status: :unprocessable_entity }

      elsif @production_item.save

        product_orders = ProductOrder.where(order_id: @production_item.order_id, product_id: po.product_id)

        product_orders.each do |p|
          p.status = 'producao'
          p.save
        end

        format.html { redirect_to @production_item, notice: 'Production item was successfully created.' }
        format.json { render json: @production_item, status: :created, location: @production_item }
      else
        format.html { render action: "new" }
        format.json { render json: @production_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /production_items/1
  # PUT /production_items/1.json
  def update
    @production_item = ProductionItem.find(params[:id])

    production_status = ProductionStatus.find(params[:production_item][:production_status_id])
    if production_status.name == "Estoque" && @production_item.production_status.name != "Estoque"
      @production_item.product_order_outs.each do |p|
        stock = ProductStock.where(product_id: p.product_id).first
        if stock 
          stock.quantity += p.quantity
          stock.save
        end
      end
    end

    respond_to do |format|
      if @production_item.update_attributes(params[:production_item])
        format.html { redirect_to @production_item, notice: 'Production item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @production_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_items/1
  # DELETE /production_items/1.json
  def destroy
    @production_item = ProductionItem.find(params[:id])
    @production_item.destroy

    respond_to do |format|
      format.html { redirect_to production_items_url }
      format.json { head :no_content }
    end
  end
end
