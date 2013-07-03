class ProductBasesController < ApplicationController
  # GET /product_bases
  # GET /product_bases.json
  def index
    @product_bases = ProductBase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_bases }
    end
  end

  # GET /product_bases/1
  # GET /product_bases/1.json
  def show
    @product_basis = ProductBase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_basis }
    end
  end

  # GET /product_bases/new
  # GET /product_bases/new.json
  def new
    @product_basis = ProductBase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_basis }
    end
  end

  # GET /product_bases/1/edit
  def edit
    @product_basis = ProductBase.find(params[:id])
  end

  # POST /product_bases
  # POST /product_bases.json
  def create
    puts params
    @product_basis = ProductBase.new(params[:product_base])

    respond_to do |format|
      if @product_basis.save
        format.html { redirect_to @product_basis, notice: 'Produto Base criado com sucesso.' }
        format.json { render json: @product_basis, status: :created, location: @product_basis }
      else
        format.html { render action: "new" }
        format.json { render json: @product_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_bases/1
  # PUT /product_bases/1.json
  def update
    @product_basis = ProductBase.find(params[:id])

    respond_to do |format|
      if @product_basis.update_attributes(params[:product_base])
        format.html { redirect_to @product_basis, notice: 'Produto Base atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_bases/1
  # DELETE /product_bases/1.json
  def destroy
    @product_basis = ProductBase.find(params[:id])
    @product_basis.destroy

    respond_to do |format|
      format.html { redirect_to product_bases_url }
      format.json { head :no_content }
    end
  end
end
