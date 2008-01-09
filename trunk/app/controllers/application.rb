# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '3f8438829100c0cf5f5a5ed73c0ba3792bd5dd1c0988b01bbe28998d2b21d8fdc0fd77d0a227d236443ee1307647cfd935b81524ba054c79cd381ac65467d370'
	
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
