class ProductColorsController < ApplicationController
  # GET /product_colors
  # GET /product_colors.json
  def index
    @product_colors = ProductColor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_colors }
    end
  end

  # GET /product_colors/1
  # GET /product_colors/1.json
  def show
    @product_color = ProductColor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_color }
    end
  end

  # GET /product_colors/new
  # GET /product_colors/new.json
  def new
    @product_color = ProductColor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_color }
    end
  end

  # GET /product_colors/1/edit
  def edit
    @product_color = ProductColor.find(params[:id])
  end

  # POST /product_colors
  # POST /product_colors.json
  def create
    @product_color = ProductColor.new(params[:product_color])
    @product_color.name = @product_color.name.upcase
    respond_to do |format|
      if @product_color.save
        format.html { redirect_to @product_color, notice: 'Cor cadastrada com sucesso.' }
        format.json { render json: @product_color, status: :created, location: @product_color }
      else
        format.html { render action: "new" }
        format.json { render json: @product_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_colors/1
  # PUT /product_colors/1.json
  def update
    @product_color = ProductColor.find(params[:id])

    respond_to do |format|
      if @product_color.update_attributes(params[:product_color])
        format.html { redirect_to @product_color, notice: 'Cor atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_colors/1
  # DELETE /product_colors/1.json
  def destroy
    @product_color = ProductColor.find(params[:id])
    @product_color.destroy

    respond_to do |format|
      format.html { redirect_to product_colors_url }
      format.json { head :no_content }
    end
  end
end
