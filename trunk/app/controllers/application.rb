# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
	before_filter :adjust_format_for_non_xhtml_browsers

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b94e9d30ec6c1e0abeed01fd8387a177'
	
	def home
		respond_to do |format|
			format.html
			format.xhtml
		end
	end
	
	def about
		respond_to do |format|
			format.html
			format.xhtml
		end
	end
	
	def contact
		respond_to do |format|
			format.html
			format.xhtml
		end
	end
	
	def resume
		respond_to do |format|
			format.html
			format.xhtml
		end
	end
	
	private

  def adjust_format_for_non_xhtml_browsers    
    request.format = :html if non_xhtml_browser?
  end
	
	def non_xhtml_browser?
    return (request.env["HTTP_ACCEPT"].split(',').include?("application/xhtml+xml")
  end
end