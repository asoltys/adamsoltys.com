class QuestTrade < Account
	has_many :transactions, :class_name => 'StockTransaction'
	
	def stocks
		transactions.collect { |t| t.stock }.uniq
	end
	
	def positions
		positions = []
		
		stocks.each do |s|
			bought_shares = sold_shares = cost = 0

			p = Position.new
			p.stock = s

			buy_transactions = transactions.select { |t| t.stock.symbol === s.symbol && t.transaction_type == 'Buy' }
			sell_transactions = transactions.select { |t| t.stock.symbol === s.symbol && t.transaction_type == 'Sell' }

			buy_transactions.each { |t| bought_shares += t.shares; cost += t.cost }
			sell_transactions.each { |t| sold_shares += t.shares; }
					
			p.shares = bought_shares - sold_shares
			
			if p.shares > 0
				p.price = cost / bought_shares
				positions.push(p)
				@value += p.value
			end
		end
		
		positions
	end
	
	def commission
		transactions.inject(0) {|sum,t| sum = t.commission }
	end
	
	def cost
		transactions.inject(0) {|sum,t| sum = t.cost }
	end
	
	def gain
		-cost
	end
	
	def profit
		value - (cost + commission)
	end
	
	def percent_return
		if cost > 0
			100 * profit / cost
		else
			0
		end
	end
end