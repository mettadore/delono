# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter {|c| Authorization.current_user = c.current_user}

  def get_business_by_subdomain
    @current_business = Business.find_by_subdomain(current_subdomain)
    if @current_business.nil?
      flash[:error] = "Business Invalid!"
      redirect_to root_url
    end
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
