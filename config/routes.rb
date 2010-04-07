ActionController::Routing::Routes.draw do |map|
  map.resources :quick_trans
  map.business_root '', :controller => 'businesses', :action => 'show', :conditions => {:subdomain => /.+/}
  
  %w(receive sell restock return loose multiple).each do |act|
    map.connect "products/:id/#{act}", :controller => 'products', :action => act
  end
  map.connect "consigners/:id/invoice", :controller => 'invoices', :action => 'invoice'
  
  map.resources :businesses
  map.resources :consigners
  map.resources :products
  map.resources :invoices
  map.resources :invitations

  map.signup 'signup/:invitation_token', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.resources :user_sessions

  map.resources :users

  map.root :controller => "home", :action => "show"
  map.home ':page', :controller => 'home', :action => "show", :page => /index/


end
