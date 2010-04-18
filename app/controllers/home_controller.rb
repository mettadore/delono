class HomeController < ApplicationController
  before_filter :get_business_by_subdomain
  def index
    #render :home
  end

  def show
    page = params[:page] ? params[:page] : "index" 
    @index = true if page == "index"
    render :action => page
  end

end
