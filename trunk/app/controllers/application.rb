# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
	before_filter :adjust_request_format

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b94e9d30ec6c1e0abeed01fd8387a177'
	
	private 
	
	def adjust_request_format
    request.format = :xhtml if xhtml_ready_browser?
		
		respond_to do |format|
			format.html
			format.xhtml
		end
  end
	
	def xhtml_ready_browser?
    request.env["HTTP_ACCEPT"].split(',').include?("application/xhtml+xml")
	end
end

