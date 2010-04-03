class UsersController < ApplicationController
  def new
    @user = User.new(:invitation_token => params[:invitation_token])
    @user.email = @user.invitation.recipient_email if @user.invitation
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to new_business_url
    else
      render :action => 'new'
    end
  end

  def show
    @user = current_user
    if @user.nil?
      redirect_to new_user_session_url
    end
    @businesses = Business.find_all_by_owner_id(@user.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile updated."
      redirect_to products_url
    else
      render :action => 'edit'
    end
  end
    
end
