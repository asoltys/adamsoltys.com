ActionController::Routing::Routes.draw do |map|		
	# Root Page

	map.root :controller => 'application', :action => 'home'

	# Static Pages
	
	map.home '/home', :controller => 'application', :action => 'home'
	map.archive '/archive', :controller => 'application', :action => 'archive'
	map.about '/about', :controller => 'application', :action => 'about'
	map.lists '/lists', :controller => 'application', :action => 'lists'
	map.contact '/contact', :controller => 'application', :action => 'contact'
	map.resume '/resume', :controller => 'application', :action => 'resume'
	map.finances '/finances', :controller => 'finances', :action => 'index'
	
	# Resources
	
	map.resources :accounts
	map.resources :companies
	map.resources :executions
	map.resources :posts
	map.resources :projects
	map.resources :reviews
  map.resource :session
	map.resources :transactions
	map.resources :users
	
	# User Routes
	
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
	
	# Finance Routes
	
	map.stocks '/stocks/:id', :controller => 'finances', :action => 'stocks'
	map.update_stocks '/update_stocks', :controller => 'finances', :action => 'update_stocks'
	map.expire_cache '/expire_cache', :controller => 'application', :action => 'expire_cache'

	map.connect '/quotes/:symbol', :controller => 'quotes', :action => 'new'
	
  # Default Routes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
