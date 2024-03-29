#encoding: utf-8
class FilialStocksController < ApplicationController
  # GET /filial_stocks
  # GET /filial_stocks.json
  def index
    @filial_stocks = nil
    if params[:filial_id]
      @filial_stocks = FilialStock.where(filial_id: params[:filial_id])
    else
      @filial_stocks = FilialStock.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @filial_stocks }
    end
  end

  # GET /filial_stocks/1
  # GET /filial_stocks/1.json
  def show
    @filial_stock = FilialStock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @filial_stock }
    end
  end

  # GET /filial_stocks/new
  # GET /filial_stocks/new.json
  def new
    @filial_stock = FilialStock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @filial_stock }
    end
  end

  # GET /filial_stocks/1/edit
  def edit
    @filial_stock = FilialStock.find(params[:id])
  end

  # POST /filial_stocks
  # POST /filial_stocks.json
  def create

    manage_filial_stock = ManageFilialStock.new

    manage_filial_stock.product_id = params[:filial_stock][:product_id]
    manage_filial_stock.filial_id = params[:filial_stock][:filial_id]
    manage_filial_stock.quantity = params[:filial_stock][:quantity]
    manage_filial_stock.action_type = params[:filial_stock][:action_type]


    @filial_stock = FilialStock.where(product_id: manage_filial_stock.product_id, filial_id: manage_filial_stock.filial_id).first


    error = false
    if @filial_stock == nil && manage_filial_stock.attr_ok?

      @filial_stock = FilialStock.new
      @filial_stock.product = manage_filial_stock.product
      @filial_stock.filial = manage_filial_stock.filial
      @filial_stock.quantity = manage_filial_stock.quantity

      manage_filial_stock.save

      @filial_stock.save
      
    elsif manage_filial_stock.attr_ok?
      @filial_stock.quantity = @filial_stock.quantity + manage_filial_stock.quantity
      manage_filial_stock.save
      @filial_stock.save
    else
      flash[:error] = "Preencha todos os campos"
      error = true
    end

    #@filial_stock = FilialStock.new(params[:filial_stock])

    respond_to do |format|
      # if @filial_stock.save
      #   format.html { redirect_to @filial_stock, notice: 'Filial stock was successfully created.' }
      #   format.json { render json: @filial_stock, status: :created, location: @filial_stock }
      # else
      #   format.html { render action: "new" }
      #   format.json { render json: @filial_stock.errors, status: :unprocessable_entity }
      # end
      if error
        @filial_stock = FilialStock.new
        format.html { render action: "new" }
      else
        format.html { redirect_to filial_stocks_path, notice: "Estoque Atualizado!" }
      end
    end
  end

  # PUT /filial_stocks/1
  # PUT /filial_stocks/1.json
  def update
    @filial_stock = FilialStock.find(params[:id])

    if (params[:filial_stock][:action_type] == "remove")
      @filial_stock.quantity = @filial_stock.quantity - params[:filial_stock][:quantity].to_i

      manage_filial_stock = ManageFilialStock.new

      manage_filial_stock.product_id = @filial_stock.product_id
      manage_filial_stock.filial_id = @filial_stock.filial_id
      manage_filial_stock.quantity = @filial_stock.quantity
      manage_filial_stock.action_type = params[:filial_stock][:action_type]
      manage_filial_stock.save
    else
      @filial_stock.filial_id = params[:filial_stock][:filial_id]
      @filial_stock.product_id = params[:filial_stock][:product_id]
    end

    respond_to do |format|
      if @filial_stock.save
        format.html { redirect_to @filial_stock, notice: 'Estoque das Filials Atualizados Com Sucesso' }
        format.json { head :no_content }
      else
        flash[:error] = "Erro ao atualizar estoque das filiais"
        format.html {redirect_to filial_stocks_path}
      end
    end
  end

  # DELETE /filial_stocks/1
  # DELETE /filial_stocks/1.json
  def destroy
    @filial_stock = FilialStock.find(params[:id])
    @filial_stock.destroy

    respond_to do |format|
      format.html { redirect_to filial_stocks_url }
      format.json { head :no_content }
    end
  end

  def remove_from_stock
    @filial_stock = FilialStock.find(params[:filial_stock_id])
  end
end
