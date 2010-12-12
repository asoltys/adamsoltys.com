ActionController::Routing::Routes.draw do

	# Root Page

	root :to => 'application#home'

	# Static Pages

	match '/home', 'application#home'
	match '/archive', 'application#archive'
	match '/about', 'application#about'
	match '/lists', 'application#lists'
	match '/contact', 'application#contact'
	match '/resume', 'application#resume'
	match '/finances', 'finances#index'
  match '/blog', 'application#home', :defaults => { :format => 'atom' }
	
	# Resources
	
	resources :accounts
	resources :companies
	resources :executions
	resources :posts
	resources :projects
	resources :reviews
	resources :review_categories
  resource :session
	resources :transactions
	resources :users

	# User Routes
	
  match '/logout', 'sessions#destroy'
  match '/login', 'sessions#new'
  match '/register', 'users#create'
	
	# Finance Routes
	
	match '/stocks', 'finances#stocks'
	match '/update_stocks', 'finances#update_stocks'
	match '/expire_cache', 'application#expire_cache'
	match '/quotes/:symbol', 'quotes#new'
	
  # Default Routes

  match ':controller/:action/:id'
  match ':controller/:action/:id.:format'

end
