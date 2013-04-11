class ProductionStatusesController < ApplicationController
  # GET /production_statuses
  # GET /production_statuses.json
  def index
    @production_statuses = ProductionStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @production_statuses }
    end
  end

  # GET /production_statuses/1
  # GET /production_statuses/1.json
  def show
    @production_status = ProductionStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @production_status }
    end
  end

  # GET /production_statuses/new
  # GET /production_statuses/new.json
  def new
    @production_status = ProductionStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @production_status }
    end
  end

  # GET /production_statuses/1/edit
  def edit
    @production_status = ProductionStatus.find(params[:id])
  end

  # POST /production_statuses
  # POST /production_statuses.json
  def create
    @production_status = ProductionStatus.new(params[:production_status])

    respond_to do |format|
      if @production_status.save
        format.html { redirect_to @production_status, notice: 'Production status was successfully created.' }
        format.json { render json: @production_status, status: :created, location: @production_status }
      else
        format.html { render action: "new" }
        format.json { render json: @production_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /production_statuses/1
  # PUT /production_statuses/1.json
  def update
    @production_status = ProductionStatus.find(params[:id])

    respond_to do |format|
      if @production_status.update_attributes(params[:production_status])
        format.html { redirect_to @production_status, notice: 'Production status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @production_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_statuses/1
  # DELETE /production_statuses/1.json
  def destroy
    @production_status = ProductionStatus.find(params[:id])
    @production_status.destroy

    respond_to do |format|
      format.html { redirect_to production_statuses_url }
      format.json { head :no_content }
    end
  end
end
