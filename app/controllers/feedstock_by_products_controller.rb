#encoding: utf-8
class FeedstockByProductsController < ApplicationController
  # GET /feedstock_by_products
  # GET /feedstock_by_products.json
  def index

    if params[:product_id]
      @feedstock_by_products = FeedstockByProduct.where(product_id: params[:product_id])
    else
      @feedstock_by_products = FeedstockByProduct.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedstock_by_products }
    end
  end

  # GET /feedstock_by_products/1
  # GET /feedstock_by_products/1.json
  def show
    @feedstock_by_product = FeedstockByProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedstock_by_product }
    end
  end

  # GET /feedstock_by_products/new
  # GET /feedstock_by_products/new.json
  def new
    @feedstock_by_product = FeedstockByProduct.new
    product = Product.find(params[:product_id])
    @feedstock_by_product.product = product

    @feedstocks = Feedstock.all(order: 'name')

    feedstock_by_products = FeedstockByProduct.where(product_id: params[:product_id])

    feedstock_by_products.each do |f|
      @feedstocks.delete(f.feedstock)
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedstock_by_product }
    end
  end

  # GET /feedstock_by_products/1/edit
  def edit
    @feedstock_by_product = FeedstockByProduct.find(params[:id])
  end

  # POST /feedstock_by_products
  # POST /feedstock_by_products.json
  def create
    
    params[:feedstock].each do |f|
      if (f[:feedstock_id] && f[:quantity] != "")
        feedstock = FeedstockByProduct.new
        feedstock.product_id = params[:product_id]
        feedstock.feedstock_id = f[:feedstock_id]
        feedstock.quantity = f[:quantity]
        feedstock.save
      end
    end

    @feedstock_by_product = FeedstockByProduct.new(params[:feedstock_by_product])

    respond_to do |format|
      format.html { redirect_to product_feedstock_by_products_path(params[:product_id]) }
      #format.json { render json: @feedstock_by_product, status: :created, location: @feedstock_by_product }    
    end
  end

  # PUT /feedstock_by_products/1
  # PUT /feedstock_by_products/1.json
  def update
    @feedstock_by_product = FeedstockByProduct.find(params[:id])

    respond_to do |format|
      if @feedstock_by_product.update_attributes(params[:feedstock_by_product])
        format.html { redirect_to product_feedstock_by_products_path(@feedstock_by_product.product_id), notice: 'Feedstock by product was successfully updated.' }
        format.json { head :no_content }
      else
        flash[:error] = "Quantidade não pode ser 0."
        format.html { redirect_to edit_product_feedstock_by_product_path(@feedstock_by_product.product_id, @feedstock_by_product.id) }
        format.json { render json: @feedstock_by_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedstock_by_products/1
  # DELETE /feedstock_by_products/1.json
  def destroy
    @feedstock_by_product = FeedstockByProduct.find(params[:id])
    product_id = @feedstock_by_product.product_id
    @feedstock_by_product.destroy

    respond_to do |format|
      format.html { redirect_to product_feedstock_by_products_path(product_id) }
      format.json { head :no_content }
    end
  end
end

