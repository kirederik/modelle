#encoding: utf-8
class FunctionsController < ApplicationController
  # GET /functions
  # GET /functions.json
  def index
    @functions = Function.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @functions }
    end
  end

  # GET /functions/1
  # GET /functions/1.json
  def show
    @function = Function.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @function }
    end
  end

  # GET /functions/new
  # GET /functions/new.json
  def new
    @function = Function.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @function }
    end
  end

  # GET /functions/1/edit
  def edit
    @function = Function.find(params[:id])
  end

  # POST /functions
  # POST /functions.json
  def create
    @function = Function.new(params[:function])

    respond_to do |format|
      if @function.save
        format.html { redirect_to @function, notice: 'Nova função criada com sucesso.' }
        format.json { render json: @function, status: :created, location: @function }
      else
        format.html { render action: "new" }
        format.json { render json: @function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /functions/1
  # PUT /functions/1.json
  def update
    @function = Function.find(params[:id])

    respond_to do |format|
      if @function.update_attributes(params[:function])
        format.html { redirect_to @function, notice: 'Função atualizada.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /functions/1
  # DELETE /functions/1.json
  def destroy
    @function = Function.find(params[:id])
    @function.destroy

    respond_to do |format|
      format.html { redirect_to functions_url }
      format.json { head :no_content }
    end
  end
end
