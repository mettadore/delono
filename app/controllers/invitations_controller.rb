class InvitationsController < ApplicationController
  # GET /invitations/new
  # GET /invitations/new.xml
  def new
    @invitation = Invitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invitation }
    end
  end

  # POST /invitations
  # POST /invitations.xml
  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user

    respond_to do |format|
      if @invitation.save
        if logged_in?        
          Mailer.deliver_invitation(@invitation, signup_url(@invitation.token))
          flash[:notice] = 'Thanks, we\'ve sent your invitation.'
          format.html { redirect_to business_root_url }
          format.xml  { render :xml => @invitation, :status => :created, :location => @invitation }
        else
          flash[:notice] = 'Thanks, we\'ll notify you when we\'re ready.'
          format.html { redirect_to root_url }
        end          
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invitation.errors, :status => :unprocessable_entity }
      end
    end
  end
end
