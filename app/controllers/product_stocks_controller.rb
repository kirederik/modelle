#encoding: utf-8
class ProductStocksController < ApplicationController
  # GET /product_stocks
  # GET /product_stocks.json
  def index
    @product_stocks = ProductStock.page(params[:page]).per(35)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_stocks }
    end
  end

  # GET /product_stocks/1
  # GET /product_stocks/1.json
  def show
    @product_stock = ProductStock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_stock }
    end
  end

  # GET /product_stocks/new
  # GET /product_stocks/new.json
  def new
    @product_stock = ProductStock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_stock }
    end
  end

  # GET /product_stocks/1/edit
  def edit
    @product_stock = ProductStock.find(params[:id])
  end

  # POST /product_stocks
  # POST /product_stocks.json
  def create
    @product_stock = ProductStock.new(params[:product_stock])

    respond_to do |format|
      if @product_stock.save
        format.html { redirect_to @product_stock, notice: 'Estoque de Produto atualizado' }
        format.json { render json: @product_stock, status: :created, location: @product_stock }
      else
        format.html { render action: "new" }
        format.json { render json: @product_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_stocks/1
  # PUT /product_stocks/1.json
  def update
    @product_stock = ProductStock.find(params[:id])

    respond_to do |format|
      if @product_stock.update_attributes(params[:product_stock])
        format.html { redirect_to @product_stock, notice: 'Estoque atualizado' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_stocks/1
  # DELETE /product_stocks/1.json
  def destroy
    @product_stock = ProductStock.find(params[:id])
    @product_stock.destroy

    respond_to do |format|
      format.html { redirect_to product_stocks_url }
      format.json { head :no_content }
    end
  end

  def remove_from_stock
    @product_order = ProductOrder.find(params[:product_order_id])
    @stock = ProductStock.where(product_id: @product_order.product_id).first

    quantity = params[:quantity]

    if (quantity.empty? || quantity.to_i == 0)
      respond_to do |format|
        flash[:error] = "Quantidade deve ser maior que 0"
        format.html { redirect_to @product_order.order }
        format.js
      end

    elsif (@product_order.quantity_stock + quantity.to_i) > (@product_order.quantity + @product_order.quantity_stock)
      respond_to do |format|
        flash[:error] = "Quantidade já usada: #{@product_order.quantity_stock} + #{quantity} é maior do que o necessário para o pedido."
        format.html { redirect_to @product_order.order }
        format.js
      end        
    elsif (@stock.quantity - quantity.to_i) >= 0
      @stock.quantity = @stock.quantity - quantity.to_i
      @product_order.quantity_stock = @product_order.quantity_stock + quantity.to_i
      @product_order.quantity = @product_order.quantity - quantity.to_i
      @stock.save

      #@product_order.status = 'estoque'
      @product_order.save

      respond_to do |format|
        flash[:notice] = "#{@stock.product.name} Atualizado. Quantidade atual: #{@stock.quantity}"
        format.html { redirect_to @product_order.order }
        format.js
      end
    else
      respond_to do |format|
        flash[:error] = "Quantidade no estoque insuficiente"
        format.html { redirect_to @product_order.order }
        format.js
      end
    end
  end

  def reset_stock
    ProductStock.all.map { |p|
      p.destroy
    }
    flash[:success] = "Estoque removido com sucesso"
    redirect_to product_stocks_path
  end
end
