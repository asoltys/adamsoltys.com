ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

	map.root :controller => 'application', :action => 'home'
	map.expire_cache '/expire_cache', :controller => 'application', :action => 'expire_cache'
	map.home '/home', :controller => 'application', :action => 'home'
	map.about '/archive', :controller => 'application', :action => 'archive'
	map.about '/about', :controller => 'application', :action => 'about'
	map.lists '/lists', :controller => 'application', :action => 'lists'
	map.contact '/contact', :controller => 'application', :action => 'contact'
	map.resume '/resume', :controller => 'application', :action => 'resume'
	map.finances '/finances', :controller => 'application', :action => 'finances'
	map.update_stocks '/update_stocks', :controller => 'application', :action => 'update_stocks'
	map.resources :reviews
	map.resources :projects
	map.resources :companies
	map.resources :users
	map.connect '/quotes/:symbol', :controller => 'quotes', :action => 'new'
	
  map.resources :posts do |post|
		post.resources :comments
	end

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
