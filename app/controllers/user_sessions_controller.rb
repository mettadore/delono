class UserSessionsController < ApplicationController
  before_filter :login_required, :only => :destroy
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      @business = Business.find(@user_session.user.manages.first)
      flash[:notice] = "Logged in successfully."
      redirect_to_target_or_default(business_products_url(@business))
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "You have been logged out."
    redirect_to root_url
  end
end
