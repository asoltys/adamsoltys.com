class FinancesController < ApplicationController
	def index
		@accounts = Account.find(:all)
		@assets = @accounts.select { |a| a.account_type == 'asset' }
		@liabilities = @accounts.select { |a| a.account_type == 'liability' }
		
		@total_assets = @assets.inject(0){|sum,a| sum = a.value}
		@total_liabilities = @liabilities.inject(0){|sum,l| sum = l.value}
		
		@net_worth = @total_assets - @total_liabilities
	end
	
	def stocks
		expire_page(:controller => 'finances', :action => 'stocks') if params[:expire_cache]

		@account = Account.find_by_type('QuestTrade')

		respond_appropriately
	end
	
	def investments
	end
	
	def update_stocks
		@stocks = Stock.find(:all)

		@stocks.each do |s|
			s.update_last_known_price
		end
		
		redirect_to stocks_path, :expire_cache => true
	end	
end