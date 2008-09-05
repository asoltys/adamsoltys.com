# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	require 'aasm'
	include AuthenticatedSystem
  helper :all # include all helpers, all the time
	before_filter :adjust_request_format
	caches_page :home, :archive, :about, :lists, :finances, :resume, :contact

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '3f8438829100c0cf5f5a5ed73c0ba3792bd5dd1c0988b01bbe28998d2b21d8fdc0fd77d0a227d236443ee1307647cfd935b81524ba054c79cd381ac65467d370'
	
	def home
		@post = Post.find(:last)
		respond_appropriately
	end
	
	def archive
		@posts = Post.find(:all)
		respond_appropriately
	end
	
	def about
		respond_appropriately
	end
	
	def lists
		respond_appropriately
	end
	
	def finances
		expire_page(:controller => 'application', :action => 'finances') if params[:expire_cache]

		@transactions = Transaction.find(:all)
		@total_cost = @total_value = @total_gain = @commissions = @percent_return = 0
		
		@transactions.each do |t|				
			@total_cost += t.cost
			@total_value += t.value
			@total_gain += t.gain
			@commissions += -2 * 4.95
		end
		
		if @total_cost > 0
			@percent_return = 100 * @total_gain / @total_cost
		end
		
		@total_profit = @total_gain + @commissions
	
		respond_appropriately
	end
	
	def update_stocks
		@stocks = Stock.find(:all)

		@stocks.each do |s|
			s.update_last_known_price
		end
		
		redirect_to :action => 'finances', :expire_cache => true
	end	
	
	def resume
		respond_appropriately
	end
	
	def contact
		respond_appropriately
	end
	
	def expire_cache
		expire_page(:controller => 'application', :action => params[:page])
		redirect_to :controller => 'application', :action => params[:page]
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
