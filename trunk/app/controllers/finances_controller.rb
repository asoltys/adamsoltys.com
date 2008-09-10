class FinancesController < ApplicationController
	def index
		@investments = Investment.find(:all)
		@liabilities = Liability.find(:all)
	end
	
	def stocks
		expire_page(:controller => 'finances', :action => 'stocks') if params[:expire_cache]

		@transactions = Transaction.find(:all)
		@profit = @commission = @gain = @cost = @value = @percent_return = 0
		
		@transactions.each do |t|				
			@commission += t.commission
			@cost += t.cost
		end
		
		@stocks = @transactions.collect { |t| t.stock }.uniq
		@positions = []
		
		@stocks.each do |s|
			bought_shares = sold_shares = cost = 0

			p = Position.new
			p.stock = s

			buy_transactions = @transactions.select { |t| t.stock.symbol === s.symbol && t.type == 'Buy' }
			sell_transactions = @transactions.select { |t| t.stock.symbol === s.symbol && t.type == 'Sell' }

			buy_transactions.each { |t| bought_shares += t.shares; cost += t.cost }
			sell_transactions.each { |t| sold_shares += t.shares; }
					
			p.shares = bought_shares - sold_shares
			
			if p.shares > 0
				p.price = cost / bought_shares
				@positions.push(p)
				@value += p.value
			end
		end

		@profit = @value - (@cost + @commission)
		@percent_return = 100 * @profit / @cost

		respond_appropriately
	end
	
	def investments
	end
	
	def update_stocks
		@stocks = Stock.find(:all)

		@stocks.each do |s|
			s.update_last_known_price
		end
		
		redirect_to finances_path, :expire_cache => true
	end	
end