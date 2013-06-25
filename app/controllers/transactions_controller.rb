class TransactionsController < ApplicationController
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @transaction = Transaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  def report
    if params[:customer_id] == ""
      respond_to do |format|
        format.html { redirect_to :action => "index", :notice => "Informe o cliente"}
      end
    else
      @transactions = Transaction.searchReport(params[:customer_id], params[:type], params[:startdate], params[:enddate])
      @customer_stocks = CustomerStock.joins(:customer).where('customer_id = ?', params[:customer_id])
      respond_to do |format|
        format.html # report.html.erb
        format.json { render json: @transactions }
      end
    end
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(params[:transaction])
    @customer_stock = CustomerStock.find(@transaction.customer_stock_id)
    if @transaction.is_devolution 
      @transaction.value = 0
    else
      @transaction.value = @transaction.value * @transaction.quantity
    end
    respond_to do |format|
      if @transaction.quantity < 0 or @customer_stock.quantity < @transaction.quantity
          format.html { redirect_to customer_stocks_reckoning_path(@customer_stock.id), notice: 'A quantidade de itens deve ser menor que a do estoque.' }
      else
        if @transaction.save
            @customer_stock.update_attributes(:quantity => @customer_stock.quantity - @transaction.quantity)
            if @transaction.is_devolution
              product = Product.find(@customer_stock.product.id)
              pr_stock = ProductStock.where('product_id = ?', product.id)[0]
              if pr_stock == nil
                ProductStock.new(
                  customer_id: @order.customer_id, 
                  product_id: po.product_id, 
                  quantity: po.quantity
                ).save
              else 
                pr_stock.update_attributes(:quantity => pr_stock.quantity + @transaction.quantity)
              end
            end
            format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
            format.json { render json: @transaction, status: :created, location: @transaction }
        else
          format.html { render action: "new" }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to @transaction, notice: 'Acerto atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end
end
