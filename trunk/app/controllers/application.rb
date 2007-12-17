# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b94e9d30ec6c1e0abeed01fd8387a177'
	
	def home
		respond_to do |format|
			format.xhtml
		end
	end
	
	def about
		respond_to do |format|
			format.xhtml
		end
	end
	
	def contact
		respond_to do |format|
			format.xhtml
		end
	end
	
	def resume
		respond_to do |format|
			format.xhtml
		end
	end
end