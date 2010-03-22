ActionController::Routing::Routes.draw do |map|
  map.resources :products
  
  %w(receive sell restock return loose).each do |act|
    map.connect "products/:id/#{act}", :controller => 'products', :action => act
  end

  map.resources :consigners

  map.resources :businesses

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.resources :user_sessions


  map.resources :users
  map.root :businesses
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
