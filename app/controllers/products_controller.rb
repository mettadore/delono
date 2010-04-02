class ProductsController < ApplicationController
  before_filter :login_required, :business
  # GET /products
  # GET /products.xml
  def index
    @products = @business.products

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = @business.products.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = @business.products.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = @business.products.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = @business.products.build(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to business_products_url(@business) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = @business.products.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to business_product_path(@business, @product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = @business.products.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to business_products_url(@business) }
      format.xml  { head :ok }
    end
  end

  def sell
    product = @business.products.find(params[:id])
    @transaction = transact(product, "sell")
    
    respond_to do |format|
      if @transaction.save
        flash[:notice] = "One Product code #{product.code} sold!"
        format.html {redirect_to :back}
      else
        format.html { render :action => "sell"}
      end
    end
  end    

  def return
    product = @business.products.find(params[:id])
    @transaction = transact(product, "return")
    
    respond_to do |format|
      if @transaction.save
        flash[:notice] = "One Product code #{product.code} returned!"
        format.html {redirect_to :back}
      else
        format.html { render :action => "return"}
      end
    end
  end    

  def restock
    product = @business.products.find(params[:id])
    @transaction = transact(product, "restock")
    
    respond_to do |format|
      if @transaction.save
        flash[:notice] = "One Product code #{product.code} restocked!"
        format.html {redirect_to :back}
      else
        format.html { render :action => "restock"}
      end
    end
  end    

  def receive
    product = @business.products.find(params[:id])
    @transaction = transact(product, "receive")
    
    respond_to do |format|
      if @transaction.save
        flash[:notice] = "One Product code #{product.code} received!"
        format.html {redirect_to :back}
      else
        format.html { render :action => "received"}
      end
    end
  end    

  def lose
    product = @business.products.find(params[:id])
    @transaction = transact(product, "lose")
    
    respond_to do |format|
      if @transaction.save
        flash[:notice] = "One Product code #{product.code} lost!"
        format.html {redirect_to :back}
      else
        format.html { render :action => "lose"}
      end
    end
  end    

  private

  def transact(product, verb)
    Transaction.new(:business_id => product.business.id,
                    :product_id => product.id,
                    :transaction_type_id => TransactionType.find_by_verb(verb).id)
  end
  
  def business
    @business = Business.find(current_user.manages.first)
  end
end
