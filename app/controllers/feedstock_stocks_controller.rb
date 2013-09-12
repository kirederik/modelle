#encoding: utf-8
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

    manage_feedstock = ManageFeedstock.new(params[:feedstock_stock])

    @feedstock_stock = FeedstockStock.where(feedstock_id: manage_feedstock.feedstock_id).first

    error = false
    if @feedstock_stock == nil && manage_feedstock.attr_ok?

      @feedstock_stock = FeedstockStock.new
      @feedstock_stock.feedstock = manage_feedstock.feedstock
      @feedstock_stock.quantity = manage_feedstock.quantity

      manage_feedstock.save

      @feedstock_stock.save
      
    elsif manage_feedstock.attr_ok?
      @feedstock_stock.quantity = @feedstock_stock.quantity + manage_feedstock.quantity
      manage_feedstock.save
      @feedstock_stock.save
    else
      flash[:error] = "Preencha todos os campos"
      error = true
    end

    respond_to do |format|
      if error
        @feedstock_stock = FeedstockStock.new
        format.html { render action: "new" }
      else
        format.html { redirect_to feedstock_stocks_path, notice: "Estoque Atualizado!" }
      end
    end

    # respond_to do |format|
    #   if false #@feedstock_stock.save
    #     format.html { redirect_to @feedstock_stock, notice: 'Matéria prima cadastrada com sucesso.' }
    #     format.json { render json: @feedstock_stock, status: :created, location: @feedstock_stock }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @feedstock_stock.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /feedstock_stocks/1
  # PUT /feedstock_stocks/1.json
  def update
    # @feedstock_stock = FeedstockStock.find(params[:id])

    # respond_to do |format|
    #   if @feedstock_stock.update_attributes(params[:feedstock_stock])
    #     format.html { redirect_to @feedstock_stock, notice: 'Feedstock stock was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @feedstock_stock.errors, status: :unprocessable_entity }
    #   end
    # end

    @feedstock_stock = FeedstockStock.find(params[:id])

    if (params[:feedstock_stock][:action_type] == "remove")
      @feedstock_stock.quantity = @feedstock_stock.quantity - params[:feedstock_stock][:quantity].to_i

      manage_feedstock = ManageFeedstock.new

      manage_feedstock.feedstock_id = @feedstock_stock.feedstock_id
      manage_feedstock.quantity = @feedstock_stock.quantity
      manage_feedstock.action_type = params[:feedstock_stock][:action_type]
      manage_feedstock.save
    else
      @feedstock_stock.feedstock_id = params[:feedstock_stock][:feedstock_id]
    end

    respond_to do |format|
      if @feedstock_stock.save
        format.html { redirect_to @feedstock_stock, notice: 'Estoque Atualizado Com Sucesso' }
        format.json { head :no_content }
      else
        flash[:error] = "Erro ao atualizar estoque"
        format.html {redirect_to feedstock_stocks_path}
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

  def remove_from_stock
    @feedstock_stock = FeedstockStock.find(params[:feedstock_stock_id])
  end
end