class ConsignersController < ApplicationController
  before_filter :login_required, :get_business_by_subdomain
  # GET /consigners
  # GET /consigners.xml
  def index
    @consigners = @current_business.consigners

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consigners }
    end
  end

  # GET /consigners/1
  # GET /consigners/1.xml
  def show
    @consigner = @current_business.consigners.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consigner }
    end
  end

  # GET /consigners/new
  # GET /consigners/new.xml
  def new
    @consigner = Consigner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consigner }
    end
  end

  # GET /consigners/1/edit
  def edit
    @consigner = @current_business.consigners.find(params[:id])
  end

  # POST /consigners
  # POST /consigners.xml
  def create
    @consigner = Consigner.new(params[:consigner])
    @current_business.consigners << @consigner

    respond_to do |format|
      if @consigner.save
        flash[:notice] = 'Consigner was successfully created.'
        format.html { redirect_to :back }
        format.xml  { render :xml => @consigner, :status => :created, :location => @consigner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consigner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consigners/1
  # PUT /consigners/1.xml
  def update
    @consigner = @current_business.consigners.find(params[:id])

    respond_to do |format|
      if @consigner.update_attributes(params[:consigner])
        flash[:notice] = 'Consigner was successfully updated.'
        format.html { redirect_to(@consigner) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consigner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consigners/1
  # DELETE /consigners/1.xml
  def destroy
    @consigner = @current_business.consigners.find(params[:id])
    @consigner.destroy

    respond_to do |format|
      format.html { redirect_to(consigners_url) }
      format.xml  { head :ok }
    end
  end

end
