class FeedstocksController < ApplicationController
  # GET /feedstocks
  # GET /feedstocks.json
  def index
    @feedstocks = Feedstock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedstocks }
    end
  end

  # GET /feedstocks/1
  # GET /feedstocks/1.json
  def show
    @feedstock = Feedstock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedstock }
    end
  end

  # GET /feedstocks/new
  # GET /feedstocks/new.json
  def new
    @feedstock = Feedstock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedstock }
    end
  end

  # GET /feedstocks/1/edit
  def edit
    @feedstock = Feedstock.find(params[:id])
  end

  # POST /feedstocks
  # POST /feedstocks.json
  def create
    @feedstock = Feedstock.new(params[:feedstock])

    respond_to do |format|
      if @feedstock.save
        format.html { redirect_to @feedstock, notice: 'Estoque criado.' }
        format.json { render json: @feedstock, status: :created, location: @feedstock }
      else
        format.html { render action: "new" }
        format.json { render json: @feedstock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedstocks/1
  # PUT /feedstocks/1.json
  def update
    @feedstock = Feedstock.find(params[:id])

    respond_to do |format|
      if @feedstock.update_attributes(params[:feedstock])
        format.html { redirect_to @feedstock, notice: 'Estoque atualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedstock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedstocks/1
  # DELETE /feedstocks/1.json
  def destroy
    @feedstock = Feedstock.find(params[:id])
    @feedstock.destroy

    respond_to do |format|
      format.html { redirect_to feedstocks_url }
      format.json { head :no_content }
    end
  end
end
