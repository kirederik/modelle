class ProductionItemsController < ApplicationController
  # GET /production_items
  # GET /production_items.json
  def index
    @production_items = ProductionItem.all

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
    @production_item.order = Order.find(params[:order_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @production_item }
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

    respond_to do |format|
      if @production_item.save
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
