class FinancesController < ApplicationController
	def index
		@accounts = Account.all
		@assets = @accounts.select { |a| a.value >= 0 }
		@liabilities = @accounts - @assets
		
		@total_assets = @assets.inject(0){|sum,a| sum += a.value}
		@total_liabilities = @liabilities.inject(0){|sum,l| sum -= l.value}
		
		@net_worth = @total_assets - @total_liabilities
	end
	
	def stocks
		expire_page(:controller => 'finances', :action => 'stocks') if params[:expire_cache]

		@account = QuestTrade.where(:name => 'QuestTrade Brokerage Account CAD').first

		respond_appropriately
	end
	
	def investments
	end
	
	def update_stocks
		redirect_to stocks_path, :expire_cache => true
	end	
end
