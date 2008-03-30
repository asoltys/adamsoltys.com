# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
	before_filter :adjust_request_format
	caches_page :home, :lists, :resume, :contact

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '3f8438829100c0cf5f5a5ed73c0ba3792bd5dd1c0988b01bbe28998d2b21d8fdc0fd77d0a227d236443ee1307647cfd935b81524ba054c79cd381ac65467d370'
	
	def home
		respond_appropriately
	end
	
	def lists
		@transactions = Transaction.find(:all)
		respond_appropriately
	end
	
	def resume
		respond_appropriately
	end
	
	def contact
		respond_appropriately
	end
	
	private
	
	def respond_appropriately	
		respond_to do |format|
			format.html
			format.xhtml
		end
	end
	
	def adjust_request_format
    request.format = :xhtml if request.format == :html && browser_supports_xhtml?
  end
	
	def browser_supports_xhtml?
		if request.env.include?("HTTP_ACCEPT")
    	request.env["HTTP_ACCEPT"].split(',').include?("application/xhtml+xml")
		else
			return false
		end
	end
end
