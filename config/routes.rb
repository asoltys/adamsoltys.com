AdamSoltys::Application.routes.draw do
	root :to => 'application#home'

	match '/home', :to => 'application#home'
	match '/archive', :to => 'application#archive'
	match '/about', :to => 'application#about'
	match '/lists', :to => 'application#lists'
	match '/contact', :to => 'application#contact'
	match '/resume', :to => 'application#resume'
	match '/finances', :to => 'finances#index'
  match '/blog', :to => 'application#home', :defaults => { :format => 'atom' }
	
	resources :accounts
	resources :companies
	resources :executions
	resources :posts

  devise_for :users
	
	match '/stocks', :to => 'finances#stocks'
	match '/update_stocks', :to => 'finances#update_stocks'
	match '/expire_cache', :to => 'application#expire_cache'
	match '/quotes/:symbol', :to => 'quotes#new'
	
  match ':controller/:action/:id'
  match ':controller/:action/:id.:format'
end
