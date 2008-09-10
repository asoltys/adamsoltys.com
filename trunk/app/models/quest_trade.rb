class QuestTrade < Account
	has_many :transactions, :class_name => "StockTransaction", :foreign_key => :account_id
	
	def stocks
		transactions.collect { |t| t.stock }.uniq
	end
	
	def buy_transactions
		transactions.select { |t| t.transaction_type == 'Buy' }
	end
	
	def sell_transactions
		transactions.select { |t| t.transaction_type == 'Sell' }
	end
	
	def positions
		positions = []
		
		stocks.each do |s|
			bought_shares = sold_shares = cost = 0

			p = Position.new
			p.stock = s

			buy_transactions = transactions.select { |t| t.stock.symbol === s.symbol && t.transaction_type == 'Buy' }
			sell_transactions = transactions.select { |t| t.stock.symbol === s.symbol && t.transaction_type == 'Sell' }

			buy_transactions.each { |t| bought_shares += t.shares; cost -= t.amount }
			sell_transactions.each { |t| sold_shares += t.shares; }
					
			p.shares = bought_shares - sold_shares
			
			if p.shares > 0
				p.price = cost / bought_shares
				positions.push(p)
			end
		end
		
		positions
	end
	
	def commission
		transactions.inject(0) {|sum,t| sum += t.commission }
	end

	def market_value
		positions.inject(0) {|sum,p| sum += p.value }
	end
	
	def value(date = Time.now)
		market_value + gain - commission
	end
	
	def cost
		buy_transactions.inject(0) {|sum,t| sum -= t.amount } - commission
	end
	
	def gain
		sell_transactions.inject(0) {|sum,t| sum += t.amount } - commission
	end
	
	def profit
		market_value + (balance - commission)
	end
	
	def balance
		transactions.inject(0) {|sum,t| sum += t.amount }
	end
	
	def percent_return
		if cost != 0
			100 * profit / cost
		else
			0
		end
	end
end