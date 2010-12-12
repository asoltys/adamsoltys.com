AdamSoltys::Application.routes.draw do

	# Root Page

	root :to => 'application#home'

	# Static Pages

	match '/home', :to => 'application#home'
	match '/archive', :to => 'application#archive'
	match '/about', :to => 'application#about'
	match '/lists', :to => 'application#lists'
	match '/contact', :to => 'application#contact'
	match '/resume', :to => 'application#resume'
	match '/finances', :to => 'finances#index'
  match '/blog', :to => 'application#home', :defaults => { :format => 'atom' }
	
	# Resources
	
	resources :accounts
	resources :companies
	resources :executions
	resources :posts
	resources :projects
	resources :reviews
	resources :review_categories
	resources :transactions
	resources :users

  resource :session

	# User Routes
	
  match '/logout', :to => 'sessions#destroy'
  match '/login', :to => 'sessions#new'
  match '/register', :to => 'users#create'
	
	# Finance Routes
	
	match '/stocks', :to => 'finances#stocks'
	match '/update_stocks', :to => 'finances#update_stocks'
	match '/expire_cache', :to => 'application#expire_cache'
	match '/quotes/:symbol', :to => 'quotes#new'
	
  # Default Routes

  match ':controller/:action/:id'
  match ':controller/:action/:id.:format'

end
