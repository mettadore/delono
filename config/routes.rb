ActionController::Routing::Routes.draw do |map|
  
  %w(receive sell restock return loose).each do |act|
    map.connect "businesses/:business_id/products/:id/#{act}", :controller => 'products', :action => act
  end

  map.resources :businesses do |business|
    business.resources :consigners
    business.resources :products
    business.resources :invoices
  end    

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.resources :user_sessions

  map.resources :users

  map.root :controller => "home", :action => "show"
  map.home ':page', :controller => 'home', :action => "show", :page => /index/


end
