#encoding: utf-8
class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  
  respond_to :html, :json
  caches_action :index, :show

  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json {render :json => @products.to_json(:methods => [:color, :size]) }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      #format.json { respond_with @product.to_json(:method => ['color', 'size']) }
      format.json {render :json => @product.to_json(:methods => [:color, :size])}
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @product.product_base_id = params[:product_basis_id]

    respond_to do |format|
      if params[:product_basis_id]
        format.html # new.html.erb
        format.json { render json: @product }
      else
        flash[:warn] = "Escolha o produto base para criar um novo produto!"
        format.html { redirect_to product_bases_path }# new.html.erb
        format.json { render json: @product }
      end
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    #@product = Product.new(params[:product])

    if params[:product][:product_size_id] && params[:product][:product_color_id]
      params[:product][:product_size_id].each do |s|
        size = ProductSize.find(s)
        params[:product][:product_color_id].each do |c|
          color = ProductColor.find(c)
          @product = Product.new
          @product.product_base_id = params[:product][:product_base_id]
          @product.product_color_id = c
          @product.product_size_id = s
          @product.save
        end
      end

    elsif params[:product][:product_size_id]
      params[:product][:product_size_id].each do |s|
        size = ProductSize.find(s)
        @product = Product.new
        @product.product_base_id = params[:product][:product_base_id]
        @product.product_size_id = s
        @product.save

      end

    elsif params[:product][:product_color_id]
      params[:product][:product_color_id].each do |c|
        color = ProductColor.find(c)
        @product = Product.new
        @product.product_base_id = params[:product][:product_base_id]
        @product.product_size_id = c
        @product.save
      end 
    end
    #@product.name = @product.product_base.name +  " " +  @product.name

    respond_to do |format|    
      format.html { redirect_to @product.product_base, notice: 'Produto cadastrado com sucesso.' }
      format.json { render json: @product, status: :created, location: @product }
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Produto atualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
